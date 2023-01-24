CREATE DATABASE bikestore_db;
USE bikestore_db; 
/*--TABLAS DE PRODUCTOS--*/
CREATE TABLE product_inventory (
id INT NOT NULL AUTO_INCREMENT,
quantity INT,
created_at TIMESTAMP,
modified_at TIMESTAMP,
deleted_at TIMESTAMP,
PRIMARY KEY (id)
);

CREATE TABLE product_category (
id INT NOT NULL AUTO_INCREMENT,
category_name VARCHAR(45) NOT NULL,
descriptn TEXT,
created_at TIMESTAMP,
modified_at TIMESTAMP,
deleted_at TIMESTAMP,
PRIMARY KEY (id)
);

CREATE TABLE discount (
id INT NOT NULL AUTO_INCREMENT,
discount_name VARCHAR(45) NOT NULL,
descriptn VARCHAR(250),
discount_percent DECIMAL(2,2),
is_active BOOLEAN NOT NULL,
created_at TIMESTAMP,
modified_at TIMESTAMP,
deleted_at TIMESTAMP,
PRIMARY KEY (id)
);

CREATE TABLE product (
id INT NOT NULL AUTO_INCREMENT,
prod_name VARCHAR(45) NOT NULL,
descriptn TEXT,
price DECIMAL(10,2) NOT NULL,
category_id INT,
inventory_id INT,
discount_id INT,
created_at TIMESTAMP NOT NULL,
modified_at TIMESTAMP NOT NULL,
deleted_at TIMESTAMP NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (category_id) REFERENCES product_category (id) ON DELETE SET NULL,
FOREIGN KEY (inventory_id) REFERENCES product_inventory (id) ON DELETE SET NULL,
FOREIGN KEY (discount_id) REFERENCES discount (id) ON DELETE SET NULL 
);

/*--TABLAS DE PRODUCTOS--*/

/*--TABLAS DE CLIENTES--*/
CREATE TABLE users (
id INT NOT NULL AUTO_INCREMENT,
username VARCHAR(25) NOT NULL,
user_password CHAR(32) NOT NULL,
first_name VARCHAR(25),
last_name VARCHAR(25),
telephone VARCHAR(45),
created_at TIMESTAMP,
modified_at TIMESTAMP,
PRIMARY KEY (id)
);

CREATE TABLE user_address (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
user_id INT NOT NULL,
address VARCHAR(95) NOT NULL,
city VARCHAR(45),
country VARCHAR(45),
mobile VARCHAR(45),
FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE user_payment (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
user_id INT NOT NULL,
payment_type VARCHAR(45),
provider VARCHAR(45),
account_no VARCHAR(45),
expiry DATE,
FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);
/*--TABLAS DE CLIENTES--*/

/*--TABLAS DE VENTAS--*/
CREATE TABLE payment_details (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
order_id INT NOT NULL UNIQUE,
amount DECIMAL(10,2) NOT NULL,
provider VARCHAR(45),
payment_status VARCHAR(45),
created_at TIMESTAMP,
modified_at TIMESTAMP
);

CREATE TABLE order_details (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
user_id INT NOT NULL,
total DECIMAL(10,2) NOT NULL,
payment_id INT NOT NULL,
created_at TIMESTAMP,
modified_at TIMESTAMP,
FOREIGN KEY (user_id) REFERENCES users (id),
FOREIGN KEY (payment_id) REFERENCES payment_details (id)
);

CREATE TABLE order_items (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
order_id INT,
product_id INT,
quantity INT NOT NULL,
created_at TIMESTAMP,
modified_at TIMESTAMP,
FOREIGN KEY (order_id) REFERENCES order_details (id),
FOREIGN KEY (product_id) REFERENCES product (id)
);



CREATE TABLE shopping_session (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
user_id INT,
total DECIMAL(10,2),
created_at TIMESTAMP,
modified_at TIMESTAMP,
FOREIGN KEY (user_id) REFERENCES users (id)
); 

CREATE TABLE cart_item (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
session_id INT,
product_id INT,
quantity INT,
created_at TIMESTAMP,
modified_at TIMESTAMP,
FOREIGN KEY (session_id) REFERENCES shopping_session (id),
FOREIGN KEY (product_id) REFERENCES product (id)
);
/*--TABLAS DE VENTAS--*/


