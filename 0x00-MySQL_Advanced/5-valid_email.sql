-- a SQL script that creates a trigger that resets valid_email
-- only when email is been changed
DELIMITER $$ ;
CREATE TRIGGER reset_valid_email_trigger BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    IF NEW.email != OLD.email THEN
        SET NEW.valid_email = 0;
    END IF;
END;
DELIMITER ;
