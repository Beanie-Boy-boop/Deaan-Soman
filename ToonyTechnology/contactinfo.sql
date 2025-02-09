CREATE DATABASE contact_info_db;

USE contact_info_db;
CREATE TABLE contacts (
    contact_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone_number VARCHAR(15),
    email VARCHAR(100),
    message TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO contacts (first_name, last_name, phone_number, email, message)
VALUES
('John', 'Doe', '123-456-7890', 'john.doe@example.com', 'This is a sample message from John.'),
('Jane', 'Smith', '987-654-3210', 'jane.smith@example.com', 'This is a sample message from Jane.');

SELECT * FROM contacts;

