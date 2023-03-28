/*USUARIO #1 FERNANDO*/
USE Mysql;
/*Crea el nombre de usuario, seguido del dominio y una contraseña de acceso*/
CREATE USER fer@localhost IDENTIFIED BY "1234";
/*Especifica el permiso que el usuario "fer" tendra en la base de datos que sera de lectura a traves de todas las tablas en la DB*/
GRANT SELECT ON bikestore_db TO 'fer'@'localhost';


/*USUARIO #2 ANA*/
/*Crea el nombre de usuario, dominio la una contraseña de acceso*/
CREATE USER ana@localhost IDENTIFIED BY "12345";

/*Otorga permisos a "ana" para leer, insertar y modificar todas las tablas de la bikestore_db*/
GRANT SELECT, INSERT, UPDATE ON bikestore_db TO 'ana'@'localhost'; 

/*USUARIO #3 carlo*/
/*Crea el nombre de usuario, dominio la una contraseña de acceso para carlo*/
CREATE USER carlo@localhost IDENTIFIED BY "9999";
/*Otorga permisos a "carlo" correspondientes a la lectura de la tabla de productos y modificar el precio */
GRANT SELECT ON bikestore_db.product TO 'carlo'@'localhost';
GRANT UPDATE (price) ON bikestore_db.product TO 'carlo'@'localhost';
/*Remover todo acceso a la base de datos para "carlo"*/
REVOKE ALL ON bikestore_db FROM 'carlo'@'localhost';
/*Eliminar el usuario "carlo" del servidor*/
DROP USER carlo@localhost;



SELECT * FROM USER WHERE USER LIKE 'root';
SELECT * FROM USER;


SHOW GRANTS FOR 'root'@'localhost';

GRANT FILE ON *.* to 'root'@'localhost';

GRANT ALL PRIVILEGES ON `bar`.* TO 'root'@'localhost';



ALTER USER 'root'@'localhost' IDENTIFIED BY '1234';






