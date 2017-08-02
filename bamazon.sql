CREATE DATABASE bamazon_db;

USE bamazon_db;

CREATE TABLE products(
	item_id INT NOT NULL AUTO_INCREMENT,
	product_name VARCHAR(45) NULL,
    department_name VARCHAR(45) NULL,
    price FLOAT NULL,
    stock_quantity INT NULL,
    PRIMARY KEY (item_id)
);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Canon G12 Digital Camera", "Camera & Photo", 200.00, 10);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Blue Bottle Coffee - Bella Donovan Blend", "Grocery & Gourmet Food", 18.50, 100);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Cat Scratching Post", "Pets", 24.95, 30);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Yoga Mat", "Excercise & Fitness", 65.00, 20);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Linen Bed Sheets", "Home & Kitchen", 150.00, 85);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Neutrogena Face Wash", "Beauty & Health", 6.21, 400);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Mediterranean Hummus", "Grocery & Gourmet Food", 4.99, 250);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Clinique Coral Lipstick", "Beauty & Health", 22.00, 60);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Plush Cat Bed", "Pets", 30.00, 8);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Leather Cat Collar", "Pets", 45.00, 1);

SELECT * FROM products;