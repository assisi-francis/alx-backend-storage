-- A SQL script that creates a trigger that decreases the quantity of an item
-- after addinga new order
-- Quantity in the table items can be negative
CREATE TRIGGER decrease_quantity_trigger AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    UPDATE items
    SET quantity = quantity - NEW.quantity
    WHERE item_id = NEW.item_id;
END;
