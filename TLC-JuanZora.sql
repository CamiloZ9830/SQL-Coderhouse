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



      
       
      
       
       
       
       
       