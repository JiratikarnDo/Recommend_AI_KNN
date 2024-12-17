from flask import Flask, request, jsonify
import mysql.connector as sql
import pandas as pd

app = Flask(__name__)

# Function เชื่อมต่อกับฐานข้อมูล
def create_connection():
    return sql.connect(
        host="localhost",
        database="finlove",
        user="root",
        password="1234"
    )

@app.route('/get_ground_truth/<int:user_id>', methods=['GET'])
def get_ground_truth(user_id):
    conn = create_connection()
    
    # SQL Query: ดึงข้อมูลที่มีเป้าหมาย, เพศที่สนใจ และความชอบตรงกัน
    query = f"""
    SELECT u1.UserID AS target_user,
           u2.UserID AS recommended_user,
           COUNT(up1.PreferenceID) AS shared_preferences
    FROM user u1
    JOIN user u2 ON u1.UserID != u2.UserID
    AND u1.interestGenderID = u2.GenderID
    AND u2.interestGenderID = u1.GenderID
    AND u1.goalID = u2.goalID
    JOIN userpreferences up1 ON u1.UserID = up1.UserID
    JOIN userpreferences up2 ON u2.UserID = up2.UserID
    AND up1.PreferenceID = up2.PreferenceID
    WHERE u1.UserID = {user_id}
    GROUP BY u1.UserID, u2.UserID
    HAVING shared_preferences > 0
    ORDER BY shared_preferences DESC;
    """
    
    # ดึงข้อมูลจากฐานข้อมูล
    df = pd.read_sql(query, conn)
    conn.close()

    # ตรวจสอบว่ามีข้อมูลหรือไม่
    if df.empty:
        return jsonify({"message": f"No matching users found for UserID {user_id}"}), 200
    
    # แปลงผลลัพธ์เป็น JSON
    result = df.to_dict(orient='records')
    return jsonify(result), 200


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=6502)
