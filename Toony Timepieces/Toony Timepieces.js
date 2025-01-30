from flask import Flask
import mysql.connector

app = Flask(__name__)

# Database connection configuration
db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': 'your_password',
    'database': 'toony_timepieces'
}

# Establish database connection
db = mysql.connector.connect(**db_config)

@app.route('/')
def home():
    return "Welcome to Toony Timepieces E-commerce Platform!"

if __name__ == '__main__':
    app.run(debug=True)
