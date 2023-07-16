-- a SQL script that creates a stored procedure ComputeAverageWeightedScoreForUser that computes and store the average weighted score for a student.
-- Procedure ComputeAverageScoreForUser is taking 1 input:
-- user_id, a users.id value (you can assume user_id is linked to an existing users)
CREATE PROCEDURE ComputeAverageWeightedScoreForUser(
  IN user_id INT
)
BEGIN
  DECLARE avg_weighted_score DECIMAL(10,2);
  
  -- Calculate the average weighted score for the user
  SELECT AVG(score * weight) INTO avg_weighted_score
  FROM scores
  WHERE user_id = user_id;

  -- Update the average weighted score for the user in the users table
  UPDATE users
  SET average_weighted_score = avg_weighted_score
  WHERE id = user_id;
  
END;
