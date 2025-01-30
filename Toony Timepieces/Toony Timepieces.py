from flask import Flask, jsonify, request
import mysql.connector

app = Flask(__name__)

# Create a connection to the database
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="toony_timepieces"
)

# API endpoint to get products
@app.route('/api/products', methods=['GET'])
def get_products():
    cursor = db.cursor(dictionary=True)
    cursor.execute("SELECT * FROM products")
    products = cursor.fetchall()
    cursor.close()
    return jsonify(products)

# Start the server
if __name__ == '__main__':
    app.run(debug=True)
