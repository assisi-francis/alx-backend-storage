-- Write a SQL script that creates a stored procedure ComputeAverageWeightedScoreForUsers that computes and store the average weighted score for all students.
-- Procedure ComputeAverageWeightedScoreForUsers is not taking any input
CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
  DECLARE user_id INT;
  DECLARE done INT DEFAULT FALSE;
  DECLARE cur CURSOR FOR SELECT id FROM users;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN cur;

  read_loop: LOOP
    FETCH cur INTO user_id;
    IF done THEN
      LEAVE read_loop;
    END IF;

    DECLARE avg_weighted_score DECIMAL(10,2);

    -- Calculate the average weighted score for the user
    SELECT AVG(score * weight) INTO avg_weighted_score
    FROM scores
    WHERE user_id = user_id;

    -- Update the average weighted score for the user in the users table
    UPDATE users
    SET average_weighted_score = avg_weighted_score
    WHERE id = user_id;

  END LOOP;

  CLOSE cur;

END;
