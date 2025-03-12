-- Create a new database
CREATE DATABASE IF NOT EXISTS perfume_store;

-- Use the new database
USE perfume_store;

-- Create a table for categories
CREATE TABLE IF NOT EXISTS categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Create a table for perfumes
CREATE TABLE IF NOT EXISTS perfumes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    category_id INT,
    created_date TIMESTAMP DEFAULT NOW(),
    modified_date TIMESTAMP DEFAULT NOW(),
    deleted_date TIMESTAMP NULL,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- Create a table for orders
CREATE TABLE IF NOT EXISTS orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    perfume_id INT,
    quantity INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (perfume_id) REFERENCES perfumes(id)
);

-- Insert initial data into categories
INSERT INTO categories (name) VALUES
('Floral'),
('Woody'),
('Fresh'),
('Oriental');

-- Insert initial data into perfumes
INSERT INTO perfumes (name, description, price, category_id) VALUES
('Rose Delight', 'A delightful floral fragrance with notes of rose and jasmine.', 49.99, 1),
('Sandalwood Bliss', 'A woody fragrance with rich sandalwood and cedar notes.', 59.99, 2),
('Citrus Splash', 'A fresh and invigorating fragrance with citrus and mint.', 39.99, 3),
('Spicy Vanilla', 'An oriental fragrance with warm vanilla and spicy notes.', 69.99, 4);