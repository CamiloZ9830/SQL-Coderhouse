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
)AUTO_INCREMENT=101;
SELECT * FROM product_inventory;

CREATE TABLE product_category (
id INT NOT NULL,
category_name VARCHAR(45) NOT NULL,
descriptn VARCHAR(255),
created_at TIMESTAMP,
modified_at TIMESTAMP,
deleted_at TIMESTAMP,
PRIMARY KEY (id)
);
SELECT * FROM product_category;




CREATE TABLE product_category_discount (
id INT NOT NULL AUTO_INCREMENT,
discount_name VARCHAR(65) NOT NULL ,
descriptn VARCHAR(255),
product_category_id INT,
discount_percent DECIMAL(4,2),
is_active BOOLEAN NOT NULL,
created_at TIMESTAMP,
valid_until TIMESTAMP,
modified_at TIMESTAMP,
deleted_at TIMESTAMP,
PRIMARY KEY (id),
FOREIGN KEY (product_category_id) REFERENCES product_category (id) ON DELETE SET NULL
);
SELECT * FROM product_category_discount;


DROP TABLE product_inventory;

CREATE TABLE product (
id INT NOT NULL AUTO_INCREMENT,
prod_name VARCHAR(65) NOT NULL,
descriptn VARCHAR(255),
model_year CHAR(4),
price DECIMAL(10,2) NOT NULL,
category_id INT,
inventory_id INT,
created_at TIMESTAMP NOT NULL,
modified_at TIMESTAMP NOT NULL,
deleted_at TIMESTAMP,
PRIMARY KEY (id),
FOREIGN KEY (category_id) REFERENCES product_category (id) ON DELETE SET NULL,
FOREIGN KEY (inventory_id) REFERENCES product_inventory (id) ON DELETE SET NULL
);
SELECT * FROM product;
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
SELECT * FROM users;

CREATE TABLE user_address (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
user_id INT NOT NULL,
address VARCHAR(95) NOT NULL,
city VARCHAR(45),
country VARCHAR(45),
mobile VARCHAR(45),
FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);
SELECT * FROM user_address;

CREATE TABLE user_payment (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
user_id INT NOT NULL,
payment_type VARCHAR(45),
provider VARCHAR(45),
account_no VARCHAR(45),
expiry DATE,
FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);
SELECT * FROM user_payment;
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
SELECT * FROM payment_details;

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
SELECT * FROM order_details;

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
SELECT * FROM order_items;



CREATE TABLE shopping_session (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
user_id INT,
total DECIMAL(10,2),
created_at TIMESTAMP,
modified_at TIMESTAMP,
FOREIGN KEY (user_id) REFERENCES users (id)
); 
SELECT * FROM shopping_session;

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
SELECT * FROM cart_item;
/*--TABLAS DE VENTAS--*/

/*--TABLAS DE ADMINISTRADORES--*/
CREATE TABLE admin_type (
id INT NOT NULL PRIMARY KEY,
admin_type VARCHAR(55) NOT NULL,
permisos VARCHAR(255) NOT NULL,
created_at TIMESTAMP,
modified_at TIMESTAMP
);
DROP TABLE admin_user ;
SELECT * FROM admin_type;

CREATE TABLE admin_user (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
username VARCHAR(25) NOT NULL,
ad_password CHAR(32) NOT NULL,
first_name VARCHAR(25),
last_name VARCHAR(25),
type_id INT,
last_login TIMESTAMP,
created_at TIMESTAMP,
modified_at TIMESTAMP,
FOREIGN KEY (type_id) REFERENCES admin_type (id) ON UPDATE CASCADE ON DELETE SET NULL
);
SELECT * FROM admin_user;
/*--TABLAS DE ADMINISTRADORES--*/


/*--TABLAS DE BITACORAS--*/
CREATE TABLE update_user_log (
update_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_user INT NOT NULL,
old_username VARCHAR(25),
old_password VARCHAR(25),
old_telephone VARCHAR(45),
modified_at TIMESTAMP
);

CREATE TABLE ondelete_admin_log (
admin_delete_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_admin INT NOT NULL,
username VARCHAR(25),
ad_password CHAR(32),
first_name VARCHAR(25),
last_name VARCHAR(25),
admin_type_id INT,
last_login TIMESTAMP,
created_at TIMESTAMP
);
/*--TABLAS DE BITACORAS--*/


/*VISTAS*/
/*--Vista Descuentos Activos
-Vista que muestra los productos que tienen el descuento de categoria activo
-Tablas usadas . product
			   . product_category
			   . product_category_discount--*/
CREATE VIEW productos_descuento_activo AS
SELECT p.id AS ID, p.prod_name AS Producto, c.category_name AS Categoria, d.discount_percent AS Descuento, 'Activo' AS Descuento1
FROM product AS p
INNER JOIN product_category AS c ON p.category_id = c.id
INNER JOIN product_category_discount AS d ON d.product_category_id = c.id
WHERE d.is_active = 1
ORDER BY p.id;


/*--Vista Productos Caracteristicas
-Muestra un descripcion detallada de un producto
-Tablas usadas . product
			   . product_category
			   . product_inventory--*/
CREATE VIEW producto_caracteristicas AS
SELECT p.id AS ID, p.prod_name AS Producto,  c.category_name AS Categoria, i.quantity AS Cantidad
FROM product AS p
INNER JOIN product_category AS c ON p.category_id = c.id
INNER JOIN product_inventory AS i ON i.id = p.inventory_id
ORDER BY c.category_name;

/*precio_mas_alto_por_categoria
-Muestra el producto mas caro por categoria
-Tablas usadas . product
			   . product_category-- */
CREATE VIEW precio_mas_alto_por_categoria AS
SELECT c.category_name, p.MAXprice  FROM product_category c 
JOIN (SELECT category_id, MAX(price) MAXprice  FROM product
GROUP BY category_id) p ON c.id = p.category_id;


/*producto_mas_caro_por_categoria
-Muestra el producto mas caro por categoria con nombre del producto y id
-Tablas usadas . product
			   . product_category-- */
CREATE VIEW producto_mas_caro_por_categoria AS
SELECT c.category_name, p2.prod_name Producto, p2.id, p.MAXprice  FROM product_category c 
JOIN (SELECT category_id, MAX(price) MAXprice  FROM product
GROUP BY category_id) p ON c.id = p.category_id
JOIN product p2 ON p2.category_id = p.category_id AND p2.price = p.MAXprice;

/* --Promedio gastado por usuario en el ecommerce
-Tablas usadas . users
			   . order_details--*/
CREATE VIEW promedio_gastado_por_usuario AS
SELECT u.id, u.first_name, u.last_name, u.username, d.promediogastado
FROM users u
LEFT JOIN (SELECT user_id, ROUND(AVG(total), 2) promediogastado FROM order_details 
GROUP BY user_id) d ON d.user_id = u.id;

/*--Vista Usuarios con compras exitosas
Relacion la tablas donde el usuario tiene compras exitosas
-Tablas usadas . users
			   . order_details
               . order_items
               . order_details
               . product--*/
CREATE VIEW compras_autorizadas AS
SELECT u.id AS UserID, u.first_name AS Nombre, u.last_name AS Apellido,  u.username AS Usuario, d.total AS Total, i.quantity AS Cantidad, p.prod_name AS Producto, p.price AS Precio, 'Confirmado' AS Estado, d.id AS Orden_ID
FROM  users AS u
JOIN order_details AS d ON u.id = d.user_id
JOIN order_items AS i ON i.order_id = d.id
JOIN payment_details AS pay ON pay.id = d.payment_id
JOIN product AS p ON p.id = i.product_id
WHERE pay.payment_status = 'Succeed';



/*FUNCIONES*/
/*--Funcion que suma el valor del IVA al precio base
- Esta funcion toma el atributo precio de una tabla y adiciona el IVA
--*/
/*Tabla IVA*/ SELECT id, prod_name, price,  CONCAT('$', " ", precio_con_iva(price)) AS plusIVA FROM product;
DELIMITER //
CREATE FUNCTION precio_con_iva (precio DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
DECLARE iva DECIMAL(3,1);
DECLARE precio_con_iva DECIMAL(10,2);
SET iva = 19.2;
SET precio_con_iva = (iva + 100)/ 100 * precio;

RETURN precio_con_iva;
END
//

/*Tabla Valor Descuento*/ SELECT p.prod_name AS Producto, p.price, CONCAT('$', " ", precio_con_iva(p.price)) AS plusIVA, precio_con_descuento(d.discount_percent, p.price, d.is_active) AS Descuento
FROM product p
LEFT JOIN product_category c ON p.category_id = c.id
LEFT JOIN product_category_discount d ON d.product_category_id = c.id;
/*--Funcion que aplica el valor del descuento activo al precio con IVA
Esta funcion usa la funcion previamente creada "precio_con_iva" para adicionar el iva al valor base de los productos y aplica el descuento por categoria si esta activa--*/
DELIMITER //
CREATE FUNCTION precio_con_descuento (discount_per DECIMAL(4,2), price DECIMAL(10,2), is_active BOOLEAN)
RETURNS VARCHAR(35) 
DETERMINISTIC
BEGIN
DECLARE precio DECIMAL(10,2);
DECLARE price_discount DECIMAL(10,2);
DECLARE discount DECIMAL(10,2);
DECLARE msg VARCHAR(35);

IF (is_active = 1) THEN
SET precio = precio_con_iva(price);
SET discount = precio * (discount_per / 100);
SET price_discount = precio - discount;
RETURN CONCAT('$', " ", price_discount);

ELSE 
SET msg = 'Sin Descuento';
RETURN msg;

END IF;

END
//

DELIMITER //
CREATE FUNCTION suma_precio (user_name VARCHAR(45))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN

END
//


/*STORED PROCEDURES*/
/*--S.P que inserta nuevos usuarios en la tabla 'users'
-Este S.P se usa para agregar un nuevo usuario--*/
DELIMITER //
CREATE PROCEDURE new_user (u_name VARCHAR(25), u_password CHAR(32), f_name VARCHAR(25), l_name VARCHAR(25), phone VARCHAR(45), created_at TIMESTAMP)
BEGIN
INSERT INTO users (username, user_password, first_name, last_name, telephone, created_at)
VALUES (u_name, u_password, f_name, l_name, phone, created_at);
SELECT * FROM users
ORDER BY id DESC;
END
//
CALL new_user('wandollar1562','momo','Robert', 'Pena', '(736) 536-5532', NOW());

/*--S.P que recibe nombre del producto y cantidad como parametros y revisa que haya inventario suficiente 
y resta la cantidad del producto en la tabla product_inventory
-Permite manejar inventario de productos restando la cantidad en el atributo 'quantity' de la tabla 'product_quantity' o agregar.--*/
DELIMITER //
CREATE PROCEDURE compra_inventario (product_name VARCHAR(65), cantidad INT) 
BEGIN
DECLARE p_id INT;
DECLARE p_price DECIMAL(10,2);
DECLARE count INT;

SELECT COUNT(1)
INTO count
FROM product p, product_inventory i
WHERE p.prod_name = product_name
AND i.quantity >= cantidad
AND p.inventory_id = i.id;

IF count > 0 THEN
SELECT inventory_id, price
INTO p_id, p_price
FROM product
WHERE prod_name = product_name;
UPDATE product_inventory
SET quantity = (quantity - cantidad)
WHERE id = p_id;
SELECT 'Producto Vendido!';
ELSE 
SELECT 'Inventario Insuficiente';
END IF;

SELECT p.id, p.prod_name, i.quantity FROM product p
JOIN product_inventory i ON i.id = p.inventory_id AND prod_name = product_name;

END
//
CALL compra_inventario('Specialized Sirrus 2.0 Step-Through 2022 Hybrid Bike', 10);

/*--SP. que busca un producto por descripcion, nombre o categoria
-Buscador de productos, encuentra por 'categoria', 'descripcion del producto' o 'nombre del producto'
-Tabla 'product'--*/
DELIMITER //
CREATE PROCEDURE search_products (search_terms VARCHAR(255))

BEGIN
         SELECT p.id, p.prod_name, p.descriptn, p.price, c.category_name
         FROM product p
         JOIN product_category c ON p.category_id = c.id 
         WHERE p.prod_name LIKE CONCAT('%', search_terms, '%')
         OR p.descriptn LIKE CONCAT('%', search_terms, '%')
         OR c.category_name LIKE CONCAT('%', search_terms, '%');
END
//
DROP PROCEDURE search_products;
CALL search_products ('electric');



/*--S.P que consulta una tabla y tiene como parametros -columna$: se escriben el nombre de la(s) columna(s)
                                                       -tabla: nombre de la tabla a consultar
													   -attr: introduce el atributo por el que se ordenara
                                                       -orden: si es ASC o DESC--*/
DELIMITER //
CREATE PROCEDURE prod_org (columna$ VARCHAR(45), tabla VARCHAR(45), attr VARCHAR(45), orden VARCHAR(20) )
BEGIN
SET @prod_orden = CONCAT('ORDER BY ', attr, ' ', orden);
SET @prod_query = CONCAT('SELECT ', columna$, ' ', 'FROM ', tabla, ' ', @prod_orden);
PREPARE runSQL FROM @prod_query;
EXECUTE runSQL;
DEALLOCATE PREPARE runSQL;
END
//

CALL prod_org ('price, prod_name','product', 'price', 'desc');

/*--S.P que actualiza el 'user_password' en la tabla 'users'
Al un usuario actualizar su clave personal--*/
DELIMITER //
CREATE PROCEDURE update_user_password (p_username VARCHAR(55), new_password CHAR(32))
BEGIN
UPDATE users
SET user_password = new_password
WHERE username = p_username;
END
//

/*--S.P que actualiza el 'telephone' en la tabla 'users'
Al un usuario actualizar el numero de telefono--*/
DELIMITER //
CREATE PROCEDURE update_user_phone_number (p_username VARCHAR(55), new_telephone VARCHAR(45))
BEGIN
UPDATE users
SET telephone = new_telephone
WHERE username = p_username;
END
//

CALL update_user_password ('dfirrelli88', '123456789');

CALL update_user_phone_number ('dfirrelli88', '(713) 704-9881');



/*TRIGGERS*/
/*--Trigger que conserva un record de la actualizacion de datos de un usuario
Se ejectuta cuando se modifica la tabla 'users' y guarda un registro en la bitacora 'update_user_log' table--*/
CREATE TRIGGER old_user_info 
AFTER UPDATE ON users
FOR EACH ROW 
INSERT INTO update_user_log (id_user, old_username, old_password, old_telephone, modified_at) 
VALUES (NEW.id, OLD.username, OLD.user_password, OLD.telephone, NOW());

/*--Trigger que se ejecuta cuando se elimina una fila de la tabla 'admin_user'  y guarda un registro en la bitacora 'ondelete_admin_log' table--*/
CREATE TRIGGER ondelete_admin
BEFORE DELETE ON admin_user
FOR EACH ROW
INSERT INTO ondelete_admin_log (id_admin, username, ad_password, first_name, last_name, admin_type_id, last_login, created_at) 
VALUES (OLD.id, OLD.username, OLD.ad_password, OLD.first_name, OLD.last_name, OLD.type_id, OLD.last_login, NOW());



SHOW TRIGGERS;
DROP TRIGGER ondelete_admin; 
SET SQL_SAFE_UPDATES = 0; 
DELETE  FROM admin_user
WHERE id = 5;

SELECT * FROM admin_user;

SELECT * FROM ondelete_admin_log;


SELECT * FROM update_user_log;



/*
Transacciones
*/
SET AUTOCOMMIT = 0;

/*Transaccion #1*/
START TRANSACTION;
INSERT INTO users (username, user_password, first_name, last_name, telephone, created_at)
VALUES ('guineafowl', 'leng', 'Dianne', 'Douglas', '(470) 783-2510', NOW());
INSERT INTO users (username, user_password, first_name, last_name, telephone, created_at)
VALUES ('twinkling', 'beavis1', 'Joyce', 'Castro', '(696) 204-9416', NOW());
INSERT INTO users (username, user_password, first_name, last_name, telephone, created_at)
VALUES  ('farflung', 'pegasus', 'Elaine', 'Allen', '(627) 714-2582', NOW());
INSERT INTO users (username, user_password, first_name, last_name, telephone, created_at)
VALUES ('drag', 'bobbob', 'Cindy', 'Vasquez', '(900) 817-3804', NOW());
INSERT INTO users (username, user_password, first_name, last_name, telephone, created_at)
VALUES  ('singe', 'darkman', 'Stacy', 'Montgomery', '(656) 996-9135', NOW());
SAVEPOINT batch1;
INSERT INTO users (username, user_password, first_name, last_name, telephone, created_at)
VALUES ('carrots', 'underwear', 'Shannon', 'Hart', '(867) 387-2991', NOW());
INSERT INTO users (username, user_password, first_name, last_name, telephone, created_at)
VALUES ('brring', 'auto', 'Alyssa', 'Ramos', '(892) 574-7772', NOW());
INSERT INTO users (username, user_password, first_name, last_name, telephone, created_at)
VALUES ('nonstop', 'safety', 'Ricardo', 'Vargas', '(890) 360-2006', NOW());
INSERT INTO users (username, user_password, first_name, last_name, telephone, created_at)
VALUES ('forked', 'lincoln', 'John', 'Weaver', '(960) 701-2316', NOW());
INSERT INTO users (username, user_password, first_name, last_name, telephone, created_at)
VALUES ('clothedninja32', 'rainderp', 'Jordan', 'Silva', '(303) 875-3589', NOW());
SAVEPOINT batch2;

/*RELEASE batch1;*/

/*Transaccion #1*/


/*Transaccion #2*/

SELECT * FROM product;

START TRANSACTION;
SAVEPOINT sp1;
DELETE FROM product 
WHERE  id IN (23,25);

/*ROLLBACK TO sp1;*/

/*COMMIT;*/



START TRANSACTION;
INSERT INTO product (id, prod_name, descriptn, model_year, price, category_id, inventory_id, created_at, modified_at)
VALUES (25, 'Whyte 909 X 2023 Mountain Bike', 'For 2023 Whyte have stepped things up again by offering the ultimte Enduro hardtail with Sram GX AXS Eagle wireless shifting.', '2023', 3500.00, 200, 124, NOW(), NOW()),
	   (23, 'Frog 62 Kids Bike - 24 Inch', "The Frog 62 is an easier rolling, lighter weight 24 inch wheel kids' bike.", '2022', 445.00, 1100, 123, NOW(), NOW());
COMMIT;

/*Transaccion #2*/

/*
Transacciones
*/



