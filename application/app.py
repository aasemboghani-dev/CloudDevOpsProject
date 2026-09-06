from flask import Flask
import os
import pymysql

app = Flask(__name__)

DB_HOST = os.getenv("DB_HOST")
DB_USER = os.getenv("DB_USER")
DB_PASSWORD = os.getenv("DB_PASSWORD")
DB_NAME = os.getenv("DB_NAME", "clouddevops")

@app.route("/")
def home():
    return "Cloud DevOps Project - Application is Running!"

@app.route("/health")
def health():
    return "OK"

@app.route("/db-test")
def db_test():
    try:
        connection = pymysql.connect(
            host=DB_HOST,
            user=DB_USER,
            password=DB_PASSWORD,
            database=DB_NAME,
            connect_timeout=5
        )
        connection.close()
        return "RDS DATABASE CONNECTION OK"
    except Exception as e:
        return f"RDS CONNECTION FAILED: {str(e)}", 500

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)