CREATE DATABASE homework5db;
USE homework5db;


### Задание 1

CREATE TABLE auto_price
(
Id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
Name VARCHAR(40) NOT NULL,
Cost INT NOT NULL
);

INSERT INTO auto_price
(Name, Cost)
VALUES
("Audi", 52642),
("Mercedes", 57127),
("Skoda", 9000),
("Volvo", 29000),
("Bentley", 350000),
("Citroen", 21000),
("Hummer", 41400),
("Volkswagen", 21600);

SELECT * FROM auto_price;

# Пункт 1
# Создайте представление, в которое попадут автомобили 
# стоимостью  до 25 000 долларов

CREATE VIEW car AS
(
SELECT * 
FROM auto_price
WHERE cost < 25000
);

SELECT * FROM car;

# Пункт 2
# Изменить в существующем представлении порог для стоимости: 
# пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW) 

ALTER VIEW car AS
(
SELECT * 
FROM auto_price
WHERE cost < 30000
);

SELECT * FROM car;

# Пункт 3
# Создайте представление, в котором будут только автомобили  
# марки “Шкода” и “Ауди”
-- CREATE VIEW skoda_audi AS
-- (
-- SELECT * FROM auto_price
-- WHERE Name = "Audi" OR Name = "Skoda"
-- );

CREATE VIEW skoda_audi AS
(
SELECT * FROM auto_price
WHERE Name IN ("Audi", "Skoda")
);

SELECT * FROM skoda_audi;

### Задание 2 ???

-- CREATE TABLE Analysis
-- (
-- an_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
-- an_name VARCHAR(10) NOT NULL,
-- an_cost INT NOT NULL,
-- an_price INT NOT NULL,
-- an_group VARCHAR(40) NOT NULL
-- );

-- CREATE TABLE Groups_
-- (
-- gr_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
-- gr_name VARCHAR(10) NOT NULL,
-- gr_temp VARCHAR(20) NOT NULL
-- );

-- CREATE TABLE Orders
-- (
-- ord_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
-- ord_datetime DATE NOT NULL,
-- gr_an INT NOT NULL,
-- FOREIGN KEY (gr_an) REFERENCES Analysis(an_id)
-- );

# Вывести название и цену для всех анализов, которые продавались 
# 5 февраля 2020 и всю следующую неделю.


# Задание 3

CREATE TABLE IF NOT EXISTS train_schedule
(
train_id INT NOT NULL,
station VARCHAR(20) NOT NULL,
station_time TIME NOT NULL
);

-- DROP TABLE train_schedule;

INSERT INTO train_schedule 
(train_id, station, station_time)
VALUES
(110, "San Francisco", '10:00:00'),
(110, "Redwood City", "10:54:00"),
(110, "Palo Alto", "11:02:00"),
(110, "San Jose", "12:35:00"),
(120, "San Francisco", "11:00:00"),
(120, "Palo Alto", "12:49:00"),
(120, "San Jose", "13:30:00");

SELECT * FROM train_schedule;

# Добавьте новый столбец под названием «время до следующей станции». 
# Чтобы получить это значение, мы вычитаем время станций для пар смежных 
# станций. Мы можем вычислить это значение без использования оконной 
# функции SQL, но это может быть очень сложно. Проще это сделать с 
# помощью оконной функции LEAD . Эта функция сравнивает значения из 
#одной строки со следующей строкой, чтобы получить результат. В этом 
# случае функция сравнивает значения в столбце «время» для станции со 
# станцией сразу после нее.

SELECT 
	train_schedule.*, 
    TIMEDIFF
    (
		LEAD(station_time) 
        OVER(PARTITION BY train_id), 
        station_time
	) AS  time_to_next_station
FROM train_schedule;
