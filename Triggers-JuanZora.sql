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





