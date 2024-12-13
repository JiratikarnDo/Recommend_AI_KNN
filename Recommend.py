from flask import Flask, send_file, request, jsonify
import mysql.connector as sql
import pandas as pd
import os
import warnings
from sklearn.neighbors import NearestNeighbors
import numpy as np

# Suppress warnings
warnings.filterwarnings("ignore")

# Create the Flask app (API)
app = Flask(__name__)

# Connection settings (no persistent connection)
def create_connection():
    return sql.connect(
        host="localhost",
        database="finlove",
        user="root",
        password="1234"
    )

# Path to the folder where images are stored
IMAGE_FOLDER = os.path.join(os.getcwd(), 'assets', 'user')

@app.route('/ai_v2/recommend/<int:id>', methods=['GET'])
def recommend(id):
    conn = create_connection()
    
    # ดึงข้อมูล Preferences, Goal และ InterestGender
    sql_query = "SELECT * FROM userpreferences"
    df = pd.read_sql(sql_query, conn)
    
    sql_goal_gender = '''
    SELECT UserID, goalID, interestGenderID
    FROM user
    '''
    goal_gender_df = pd.read_sql(sql_goal_gender, conn)
    df = pd.merge(df, goal_gender_df, on="UserID", how="left")
    df = pd.get_dummies(df, columns=["goalID", "interestGenderID"], prefix=["goal", "gender"])
    df_pivot = df.pivot_table(index='UserID', aggfunc='sum', fill_value=0)

    # Content-Based Filtering (CBF)
    if id not in df_pivot.index:
        return jsonify({"error": f"UserID {id} not found in preferences table"}), 404
    cbf_knn = NearestNeighbors(metric='cosine', algorithm='brute')
    cbf_knn.fit(df_pivot.values)
    cbf_distances, cbf_indices = cbf_knn.kneighbors(df_pivot.loc[[id]].values, n_neighbors=5)
    cbf_recommended_user_ids = df_pivot.index[cbf_indices[0]].tolist()
    cbf_recommended_user_ids.remove(id)
    
    # Collaborative Filtering (CF)
    sql_likes = '''
    SELECT likerID, likedID
    FROM userlike
    '''
    likes_df = pd.read_sql(sql_likes, conn)
    likes_pivot = likes_df.pivot_table(index='likerID', columns='likedID', aggfunc='size', fill_value=0)
    if id in likes_pivot.index:
        cf_knn = NearestNeighbors(metric='cosine', algorithm='brute')
        cf_knn.fit(likes_pivot.values)
        cf_distances, cf_indices = cf_knn.kneighbors(likes_pivot.loc[[id]].values, n_neighbors=5)
        cf_recommended_user_ids = likes_pivot.index[cf_indices[0]].tolist()
        cf_recommended_user_ids.remove(id)
    else:
        cf_recommended_user_ids = []

    # Hybrid Recommendation: รวมผลลัพธ์จาก CBF และ CF
    combined_user_ids = list(set(cbf_recommended_user_ids + cf_recommended_user_ids))
    if not combined_user_ids:
        return jsonify({"message": "No similar users found"}), 200
    combined_user_ids_str = ', '.join(map(str, combined_user_ids))

    # ดึงข้อมูลผู้ใช้ที่แนะนำ
    sql_query = f'''
    SELECT 
        u.UserID AS userID, 
        u.nickname, 
        u.imageFile,
        u.verify
    FROM user u
    LEFT JOIN matches m ON (m.user1ID = u.UserID AND m.user2ID = {id}) OR (m.user2ID = u.UserID AND m.user1ID = {id})
    LEFT JOIN blocked_chats b ON (b.user1ID = {id} AND b.user2ID = u.UserID) OR (b.user2ID = {id} AND b.user1ID = u.UserID)
    WHERE u.UserID IN ({combined_user_ids_str})
        AND m.matchID IS NULL
        AND (b.isBlocked IS NULL OR b.isBlocked = 0)
        AND u.GenderID = (SELECT interestGenderID FROM user WHERE UserID = {id})
        AND u.interestGenderID = (SELECT GenderID FROM user WHERE UserID = {id})
    '''
    recommended_users = pd.read_sql(sql_query, conn)
    conn.close()
    
    # ปรับเส้นทางของ imageFile
    for index, user in recommended_users.iterrows():
        if user['imageFile']:
            recommended_users.at[index, 'imageFile'] = f"http://{request.host}/ai_v2/user/{user['imageFile']}"

    return jsonify(recommended_users[['userID', 'nickname', 'imageFile', 'verify']].to_dict(orient='records')), 200




@app.route('/ai_v2/user/<filename>', methods=['GET'])
def get_user_image(filename):
    # Full path to the image file
    image_path = os.path

# Create Web server
if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=6502)