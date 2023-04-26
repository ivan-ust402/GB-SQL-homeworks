CREATE DATABASE homework5db;
USE homework5db;

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

# Задание 1
# Создайте представление, в которое попадут автомобили 
# стоимостью  до 25 000 долларов

CREATE VIEW car AS
SELECT * 
FROM auto_price
WHERE cost < 25000;

SELECT * FROM car;

# Задание 2
# Изменить в существующем представлении порог для стоимости: 
# пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW) 



# Задание 3
# Создайте представление, в котором будут только автомобили  
# марки “Шкода” и “Ауди”
