-- a SQL script that creates a stored procedure AddBonus
-- that adds a new corection for a student
--user_id
-- project_name
-- score
CREATE PROCEDURE AddBonus(
  IN user_id INT,
  IN project_name VARCHAR(255),
  IN score DECIMAL(10,2)
)
BEGIN
  DECLARE project_id INT;

  -- Check if the project already exists
  SELECT id INTO project_id FROM projects WHERE name = project_name;

  -- If the project doesn't exist, create it
  IF project_id IS NULL THEN
    INSERT INTO projects (name) VALUES (project_name);
    SET project_id = LAST_INSERT_ID();
  END IF;

  -- Add the correction for the student
  INSERT INTO corrections (user_id, project_id, score) VALUES (user_id, project_id, score);

  -- Optional: You can include additional logic or actions here if needed

END;
