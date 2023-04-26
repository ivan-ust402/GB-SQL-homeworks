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
