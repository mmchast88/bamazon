DROP DATABASE IF EXISTS bamazon_db;

CREATE DATABASE bamazon_db;

USE bamazon_db;

CREATE TABLE products (
  item_id INTEGER(11) AUTO_INCREMENT NOT NULL,
  
  product_name VARCHAR(50) NOT NULL,
 
  department_name VARCHAR(50) NOT NULL,
  
  price INTEGER(10) NOT NULL,

  stock_quantity INTEGER(10) NOT NULL,
  PRIMARY KEY (item_id)
);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES 				 ("Redkin Color Shampoo", "Health and Beauty", 9, 30);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES               ("Quest Proten Bars", "Health and Fitness", 25, 50);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES               ("GNC Multi-Vitamins for Women", "Health and Beauty", 15, 100);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES               ("Crest with Scope Toothpaste- 3 pack", "Health and Beauty", 8, 200);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES               ("Natural Balance Dry Dog Food", "Pet Supplies", 50, 70);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES               ("GNC Whey Protein- Vanilla", "Health and Household", 40, 30);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES               ("Apple Earphones", "Electronics", 20, 90);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES               ("National Geographic Magazine", "Magazine Subscriptions", 20, 20);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES               ("Oster Waffle Maker", "House and Kitchen", 15, 40);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES               ("Iphone Car Charger", "Electronics", 12, 30);