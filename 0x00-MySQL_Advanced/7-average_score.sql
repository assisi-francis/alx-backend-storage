-- a SqL script that creates a stored procedure ComputeAverageScoreForUser
-- that computes and store the average score for a student
-- average score can be decimal
-- ComputeAverageScoreForUser is taking 1 input
-- user_id, a users.id value (you can assume user_id is linked to an existing users)

DELIMITER $$
CREATE PROCEDURE ComputeAverageScoreForUser(
  IN user_id INT
)
BEGIN
  DECLARE avg_score DECIMAL(10,2);
  DECLARE project_count INT;

  -- Count the number of projects for the user
  SELECT COUNT(DISTINCT project_id) INTO project_count
  FROM corrections
  WHERE user_id = user_id;

  -- Calculate the average score for the user
  IF project_count >= 1 THEN
    SELECT AVG(score) INTO avg_score
    FROM (
      SELECT score
      FROM corrections
      WHERE user_id = user_id
      ORDER BY score DESC
      LIMIT project_count
    ) AS subquery;
  ELSE
    SET avg_score = 0;
  END IF;

  -- Update the average score for the user in the users table
  UPDATE users
  SET average_score = avg_score
  WHERE id = user_id;

END$$
DELIMITER ;
