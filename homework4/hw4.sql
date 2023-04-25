-- CREATE DATABASE homework4db;
-- USE homework4db;

CREATE TABLE  AUTO 
(       
	REGNUM VARCHAR(10) PRIMARY KEY, 
	MARK VARCHAR(10), 
	COLOR VARCHAR(15),
	RELEASEDT DATE, 
	PHONENUM VARCHAR(15)
);

 -- AUTO
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111114,'LADA', 'КРАСНЫЙ', date'2008-01-01', '9152222221');

INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111115,'VOLVO', 'КРАСНЫЙ', date'2013-01-01', '9173333334');

INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111116,'BMW', 'СИНИЙ', date'2015-01-01', '9173333334');

INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111121,'AUDI', 'СИНИЙ', date'2009-01-01', '9173333332');

INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111122,'AUDI', 'СИНИЙ', date'2011-01-01', '9213333336');

INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111113,'BMW', 'ЗЕЛЕНЫЙ', date'2007-01-01', '9214444444');

INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111126,'LADA', 'ЗЕЛЕНЫЙ', date'2005-01-01', null);

INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111117,'BMW', 'СИНИЙ', date'2005-01-01', null);

INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111119,'LADA', 'СИНИЙ', date'2017-01-01', 9213333331);




SELECT * FROM AUTO;

# Задание 1. Вывести на экран сколько машин каждого цвета 
# для машин марок BMW и Lada

SELECT COLOR, COUNT(REGNUM) AS LADA_BMW_CARS_COUNT
FROM AUTO
WHERE MARK IN ("BMW", "LADA")
GROUP BY COLOR;

# Задание 2. Вывести на экран марку авто(количество) и количество 
# AUTO не этой марки
SELECT t1.MARK, COUNT(t2.REGNUM) AS OTHER_CAR_COUNT
FROM (
	SELECT DISTINCT MARK
    FROM AUTO
) AS t1
LEFT JOIN AUTO AS t2
ON t1.MARK != t2.MARK
GROUP BY t1.MARK;

# Задание 3. 
-- Даны 2 таблицы, созданные следующим образом:

CREATE TABLE IF NOT EXISTS test_a
(
id INT,
test VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS test_b
(
id INT
);

INSERT INTO test_a(id, test) 
VALUES
(10, 'A'),
(20, 'A'),
(30, 'F'),
(40, 'D'),
(50, 'C');

INSERT INTO test_b(id) 
VALUES
(10),
(30),
(50);

SELECT * FROM test_a;
SELECT * FROM test_b;

-- Напишите запрос, который вернет строки из таблицы test_a, 
-- id которых нет в таблице test_b, НЕ используя ключевого слова NOT.

SELECT test_a.*, test_b.*
FROM test_a
LEFT JOIN test_b
ON test_a.id = test_b.id
WHERE test_b.id IS NULL;





