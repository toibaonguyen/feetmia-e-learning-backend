--create procedure to drop all foreign keys of a table

DELIMITER $$

CREATE PROCEDURE drop_all_foreign_keys(IN tbl_name VARCHAR(64))
BEGIN
  DECLARE done INT DEFAULT 0;
  DECLARE fk_name VARCHAR(64);
  DECLARE cur CURSOR FOR
    SELECT CONSTRAINT_NAME
    FROM information_schema.REFERENTIAL_CONSTRAINTS
    WHERE CONSTRAINT_SCHEMA = DATABASE()
      AND TABLE_NAME = tbl_name;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

  OPEN cur;
  read_loop: LOOP
    FETCH cur INTO fk_name;
    IF done THEN
      LEAVE read_loop;
    END IF;

    SET @stmt = CONCAT('ALTER TABLE `', tbl_name, '` DROP FOREIGN KEY `', fk_name, '`');
    PREPARE stmt FROM @stmt;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
  END LOOP;
  CLOSE cur;
END$$

DELIMITER ;

CALL drop_all_foreign_keys('courses_ratings');

ALTER TABLE courses_ratings
DROP PRIMARY KEY;

ALTER TABLE courses_ratings
ADD COLUMN id VARCHAR(255) PRIMARY KEY;

ALTER TABLE users
MODIFY COLUMN full_name VARCHAR(255) NOT NULL;