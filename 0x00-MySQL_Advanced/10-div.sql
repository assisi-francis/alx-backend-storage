-- a SQL script that creates a function SafeDiv that divides (and returns) the first by the second number or returns 0 if the second number is equal to 0.
-- The function SafeDiv takes 2 arguments: a, INT b, INT
-- And returns a / b or 0 if b == 0
CREATE FUNCTION SafeDiv(a INT, b INT)
RETURNS FLOAT
BEGIN
  DECLARE result FLOAT;
  
  IF b = 0 THEN
    SET result = 0;
  ELSE
    SET result = a / b;
  END IF;
  
  RETURN result;
END;
