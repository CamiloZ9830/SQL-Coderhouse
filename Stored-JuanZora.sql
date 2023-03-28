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


