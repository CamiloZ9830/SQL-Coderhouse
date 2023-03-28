
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


