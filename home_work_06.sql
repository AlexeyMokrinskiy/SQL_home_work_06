/*
1.	Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
*/

DELIMITER //
CREATE FUNCTION secs(n INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
	DECLARE days INT DEFAULT 0;
	DECLARE hours INT DEFAULT 0;
	DECLARE minutes INT DEFAULT 0;
	DECLARE seconds INT DEFAULT 0;
    DECLARE res VARCHAR(255) DEFAULT '';
	
    set days = n div 86400;
    set hours = (n % 86400) div 3600;
    set minutes = ((n % 86400) % 3600) div 60;
    set seconds = (((n % 86400) % 3600) % 60) % 60;
    
    set res = CONCAT(n, ' ', '->', ' ', days, ' ', 'days', ' ', hours, ' ', 'hours', ' ', minutes, ' ', 'minutes', ' ', seconds, ' ', 'seconds');
	
	RETURN res;
END //
DELIMITER ;

SELECT secs(11111111);

/*
Выведите только четные числа от 1 до 10 включительно.
Пример: 2,4,6,8,10 (можно сделать через шаг +  2: х = 2, х+=2)
*/

DELIMITER $$
CREATE PROCEDURE even()
BEGIN
	DECLARE n INT DEFAULT 0;
	DECLARE res VARCHAR(50) DEFAULT '';

		WHILE n < 10 DO
		SET n = n + 2;
		SET res = CONCAT(res, ' ', n);
		END WHILE;
        
	SELECT res;
END $$
DELIMITER ;

CALL even();