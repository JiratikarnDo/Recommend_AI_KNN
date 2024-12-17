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

    # ===================== ดึงข้อมูล Preferences =====================
    sql_preferences = '''
    SELECT UserID, PreferenceID
    FROM userpreferences
    '''
    preferences_df = pd.read_sql(sql_preferences, conn)
    print("Preferences Data Loaded:")
    print(preferences_df.head())  # Debug

    # Pivot Table สำหรับ PreferenceID
    preferences_pivot = preferences_df.pivot_table(index='UserID', columns='PreferenceID', aggfunc='size', fill_value=0)
    print("Preferences Pivot Table:")
    print(preferences_pivot.head())  # Debug

    # ===================== ดึงข้อมูล GoalID และ Gender =====================
    sql_goal_gender = '''
    SELECT UserID, goalID, interestGenderID, GenderID
    FROM user
    '''
    goal_gender_df = pd.read_sql(sql_goal_gender, conn)
    print("Goal and Gender Data Loaded:")
    print(goal_gender_df.head())  # Debug

    # ตรวจสอบ UserID
    if id not in goal_gender_df['UserID'].values:
        print(f"UserID {id} not found!")
        return jsonify({"error": f"UserID {id} not found"}), 404

    # ดึง InterestGenderID และเพศของผู้ใช้งาน
    user_info = goal_gender_df.loc[goal_gender_df['UserID'] == id].iloc[0]
    interest_gender = user_info['interestGenderID']
    print(f"User {id} Info: GenderID={user_info['GenderID']}, InterestGenderID={interest_gender}")  # Debug

    # รวม Preferences และ GoalID
    goal_gender_df = pd.get_dummies(goal_gender_df, columns=["goalID"], prefix="goal")
    final_df = preferences_pivot.join(goal_gender_df.set_index('UserID'), on='UserID', how='left')
    print("Final Combined DataFrame:")
    print(final_df.head())

    # ===================== KNN (Content-Based Filtering) =====================
    from sklearn.neighbors import NearestNeighbors
    print("Running KNN for Content-Based Filtering...")
    cbf_knn = NearestNeighbors(metric='cosine', algorithm='brute')
    cbf_knn.fit(final_df.fillna(0).values)
    distances, indices = cbf_knn.kneighbors(final_df.loc[[id]].fillna(0).values, n_neighbors=10)

    # ดึงผลลัพธ์จาก KNN
    knn_users = final_df.index[indices[0]].tolist()
    knn_users.remove(id)
    recommended_users = list(set(knn_users))
    print(f"Raw KNN Users: {recommended_users}")

    # กรองเฉพาะผู้ใช้ที่มีเพศตรงกับ interest_gender
    filtered_users = goal_gender_df[
        (goal_gender_df['UserID'].isin(recommended_users)) &
        (goal_gender_df['GenderID'] == interest_gender)
    ]['UserID'].tolist()
    recommended_users = filtered_users
    print(f"Filtered Users by Gender: {recommended_users}")

    # ===================== Fallback Rule-Based =====================
    required_users = 5 - len(recommended_users)
    print(f"Required users from Fallback: {required_users}")

    if required_users > 0:
        # เช็คว่ามี recommended_users หรือไม่
        not_in_clause = f"AND u.UserID NOT IN ({', '.join(map(str, recommended_users))})" if recommended_users else ""

        fallback_sql = f'''
        SELECT DISTINCT u.UserID
        FROM user u
        LEFT JOIN matches m ON (m.user1ID = u.UserID AND m.user2ID = {id}) OR (m.user2ID = u.UserID AND m.user1ID = {id})
        LEFT JOIN blocked_chats b ON (b.user1ID = {id} AND b.user2ID = u.UserID) OR (b.user2ID = {id} AND b.user1ID = {id})
        WHERE u.UserID != {id}
          {not_in_clause}  -- ไม่ใส่เงื่อนไขถ้า recommended_users เป็น empty
          AND u.GenderID = {interest_gender}
          AND (b.isBlocked IS NULL OR b.isBlocked = 0)
          AND m.matchID IS NULL
        LIMIT {required_users}
        '''
        print(f"Generated Fallback SQL Query:\n{fallback_sql}")  # Debug
        fallback_users = pd.read_sql(fallback_sql, conn)
        print(f"Users fetched from Fallback: {fallback_users['UserID'].tolist()}")

        recommended_users.extend(fallback_users['UserID'].tolist())

    # ===================== รวมผลลัพธ์และจำกัดจำนวน =====================
    recommended_users = list(set(recommended_users))[:5]
    print(f"Final Recommended Users: {recommended_users}")

    # ===================== ดึงข้อมูลผู้ใช้ที่แนะนำ =====================
    if not recommended_users:
        print("No sufficient users found!")
        return jsonify({"message": "No sufficient users found"}), 200

    combined_user_ids_str = ', '.join(map(str, recommended_users))
    sql_query = f'''
    SELECT 
        u.UserID AS userID, 
        u.nickname, 
        u.imageFile,
        u.verify
    FROM user u
    WHERE u.UserID IN ({combined_user_ids_str})
    '''
    print(f"Final SQL Query to fetch user details:\n{sql_query}")
    recommended_users_df = pd.read_sql(sql_query, conn)
    conn.close()

    # ปรับเส้นทางของ imageFile
    for index, user in recommended_users_df.iterrows():
        if user['imageFile']:
            recommended_users_df.at[index, 'imageFile'] = f"http://{request.host}/ai_v2/user/{user['imageFile']}"

    print("Returning final response...")
    return jsonify(recommended_users_df.to_dict(orient='records')), 200



@app.route('/ai_v2/user/<filename>', methods=['GET'])
def get_user_image(filename):
    # Full path to the image file
    image_path = os.path

# Create Web server
if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=6502)