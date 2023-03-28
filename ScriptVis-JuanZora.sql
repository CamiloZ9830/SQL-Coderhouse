/*--Vista Descuentos Activos
-Vista que muestra los productos que tienen el descuento de categoria activo
-Tablas usadas . product
			   . product_category
			   . product_category_discount--*/
CREATE VIEW productos_descuento_activo AS
SELECT p.id AS ID, p.prod_name AS Producto, d.discount_name AS TipoDescuento, c.category_name AS Categoria, CONCAT(d.discount_percent, " %") AS Descuento, 'Activo' AS Descuento1
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

SELECT c.category_name Categoria, p.prod_name Producto, p.id, p.MAXprice
FROM product_category c
JOIN (
  SELECT category_id, id, prod_name, price AS MAXprice
  FROM product p1
  WHERE price = (
    SELECT MAX(price)
    FROM product p2
    WHERE p1.category_id = p2.category_id
  )
) p ON c.id = p.category_id;



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
SELECT * FROM order_details;



