-- Create a database
CREATE DATABASE toony_timepieces;

-- Use the newly created database
USE toony_timepieces;

-- Create a table for products
CREATE TABLE products (
    productID INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    description TEXT,
    price DECIMAL(10, 2),
    stock INT
);

-- Create a table for users
CREATE TABLE users (

    userID INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE,
    email VARCHAR(100),
    password VARCHAR(255)
);

-- Create a table for orders
CREATE TABLE orders (
    orderID INT PRIMARY KEY AUTO_INCREMENT,
    userID INT,
    orderDate DATETIME,
    totalAmount DECIMAL(10, 2),
    FOREIGN KEY (userID) REFERENCES users(userID)
);

-- Create a table for order items
CREATE TABLE order_items (
    orderItemID INT PRIMARY KEY AUTO_INCREMENT,
    orderID INT,
    productID INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (orderID) REFERENCES orders(orderID),
    FOREIGN KEY (productID) REFERENCES products(productID)
);

-- Insert sample data into users table
INSERT INTO users (username, email, password) VALUES ('john_doe', 'john@example.com', 'password123');
INSERT INTO users (username, email, password) VALUES ('jane_doe', 'jane@example.com', 'password456');

-- Insert sample data into products table
INSERT INTO products (name, description, price, stock) VALUES ('Laptop Model XYZ', 'High-performance laptop for gaming and productivity.', 1200.00, 20);
INSERT INTO products (name, description, price, stock) VALUES ('Laptop Model ABC', 'Lightweight and powerful laptop for everyday use.', 800.00, 15);

-- Insert sample data into orders table
INSERT INTO orders (userID, orderDate, totalAmount) VALUES (1, '2025-01-01 10:00:00', 1200.00);

-- Insert sample data into order_items table
INSERT INTO order_items (orderID, productID, quantity, price) VALUES (1, 1, 1, 1200.00);

