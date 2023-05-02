CREATE DATABASE homework6db;
USE homework6db;

### Задание 1
-- Создайте функцию, которая принимает кол-во сек и форматирует их 
-- в кол-во дней, часов, минут и секунд.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
DELIMITER $$
CREATE FUNCTION date_from_number(num INT)
RETURNS VARCHAR(255) DETERMINISTIC
BEGIN
DECLARE days INT DEFAULT 0; 
DECLARE hours INT DEFAULT 0; 
DECLARE minutes INT DEFAULT 0; 
DECLARE seconds INT DEFAULT 0;
DECLARE seconds_in_minute INT DEFAULT 60;
DECLARE minutes_in_hour INT DEFAULT 60;
DECLARE hours_in_day INT DEFAULT 24;
DECLARE result VARCHAR(255) DEFAULT '';
SET seconds = NUM % seconds_in_minute;
SET minutes = floor(NUM / seconds_in_minute) % minutes_in_hour;
SET hours = floor(floor(NUM / seconds_in_minute) / minutes_in_hour) % hours_in_day;
SET days = floor(NUM / (seconds_in_minute * minutes_in_hour * hours_in_day));
SET result = concat(result, days);
SET result = concat(result, " days ");
SET result = concat(result, hours);
SET result = concat(result, " hours ");
SET result = concat(result, minutes);
SET result = concat(result, " minutes ");
SET result = concat(result, seconds);
SET result = concat(result, " seconds");
RETURN result;
END $$
DELIMITER ;

-- DROP FUNCTION date_from_number;

SELECT date_from_number(123456);


### Задание 2
-- Выведите только четные числа от 1 до 10 включительно.
-- Пример: 2,4,6,8,10 (можно сделать через шаг + 2: х = 2, х+=2)
DELIMITER $$
CREATE PROCEDURE even_numbers()
BEGIN
DECLARE num INT DEFAULT 10;
DECLARE iter INT DEFAULT 1;
DECLARE result VARCHAR(255) DEFAULT '';
WHILE iter <= num DO
	IF (iter % 2) = 0 THEN
		SET result = concat(result, iter, ' ');
	END IF;
	SET iter = iter + 1;
END WHILE;   
SELECT result;
END$$
DELIMITER ;

-- DROP PROCEDURE even_numbers;

CALL even_numbers();
