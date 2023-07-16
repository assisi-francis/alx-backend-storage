-- a SqL script that creates a stored procedure ComputeAverageScoreForUser
-- that computes and store the average score for a student
-- average score can be decimal
-- ComputeAverageScoreForUser is taking 1 input
-- user_id, a users.id value (you can assume user_id is linked to an existing users)

CREATE PROCEDURE ComputeAverageScoreForUser(
  IN user_id INT
)
BEGIN
  DECLARE avg_score DECIMAL(10,2);

  -- Calculate the average score for the user
  SELECT AVG(score) INTO avg_score
  FROM corrections
  WHERE user_id = user_id;

  -- Update the average score for the user in the users table
  UPDATE users
  SET average_score = avg_score
  WHERE id = user_id;
  
  -- Optional: You can include additional logic or actions here if needed
  
END;
