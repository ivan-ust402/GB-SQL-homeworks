CREATE DATABASE homework3db;

USE homework3db;

CREATE TABLE salespeople
(
snum INT PRIMARY KEY NOT NULL UNIQUE,
sname VARCHAR(20) NOT NULL,
city VARCHAR(40) NOT NULL,
comm DECIMAL(5, 2) NOT NULL
);

INSERT INTO salespeople
(snum, sname, city, comm)
VALUE
(1001, "Peel", "London", .12),
(1002, "Serres", "San Jose", .13),
(1004, "Motika", "London", .11),
(1007, "Rifkin", "Barcelona", .15),
(1003, "Axelrod", "New York", .10);

-- DROP TABLE salespeople;
SELECT * FROM salespeople;

CREATE TABLE customers
(
cnum INT PRIMARY KEY NOT NULL UNIQUE,
cname VARCHAR(20) NOT NULL,
city VARCHAR(40) NOT NULL,
rating INT NOT NULL,
snum INT NOT NULL,
FOREIGN KEY (snum) REFERENCES salespeople (snum)
);

INSERT INTO customers
(cnum, cname, city, rating, snum)
VALUE
(2001, "Hoffman", "London", 100, 1001),
(2002, "Giovanni", "Rome", 200, 1003),
(2003, "Liu", "San Jose", 200, 1002),
(2004, "Grass", "Berlin", 300, 1002),
(2006, "Clemens", "London", 100, 1001),
(2008, "Cisneros", "San Jose", 300, 1007),
(2007, "Pereira", "Rome", 100, 1004);

-- DROP TABLE customers;
SELECT * FROM customers;


CREATE TABLE orders
(
onum INT PRIMARY KEY NOT NULL UNIQUE,
amt DECIMAL(6, 2) NOT NULL,
odate VARCHAR(20) NOT NULL,
cnum INT NOT NULL,
snum INT NOT NULL,
FOREIGN KEY (snum) REFERENCES salespeople (snum),
FOREIGN KEY (cnum) REFERENCES customers (cnum)
);

INSERT INTO orders
(onum, amt, odate, cnum, snum)
VALUE
(3001, 18.69, "10/03/1990", 2008, 1007),
(3003, 767.19, "10/03/1990", 2001, 1001),
(3002, 1900.10, "10/03/1990", 2007, 1004),
(3005, 5160.45, "10/03/1990", 2003, 1002),
(3006, 1098.16, "10/03/1990", 2008, 1007),
(3009, 1713.23, "10/04/1990", 2002, 1003),
(3007, 75.75, "10/04/1990", 2004, 1002),
(3008, 4723.00, "10/05/1990", 2006, 1001),
(3010, 1309.95, "10/06/1990", 2004, 1002),
(3011, 9891.88, "10/06/1990", 2006, 1001);

-- DROP TABLE orders;
SELECT * FROM orders;

# 1. Напишите запрос, который вывел бы таблицу со столбцами в следующем порядке:
#    city, sname, snum, comm. (к первой или второй таблице, используя SELECT)

SELECT city, sname, snum, comm
FROM salespeople;

SELECT city, cname, cnum, rating
FROM customers;

# 2. Напишите команду SELECT, которая вывела бы оценку(rating),
#    cопровождаемую именем каждого заказчика в городе San Jose. (“заказчики”)

SELECT rating, cname
FROM customers
WHERE city = "San Jose";

