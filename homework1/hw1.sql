CREATE DATABASE mobilephonedb;

USE mobilephonedb;

SELECT * FROM phone;

SELECT ProductName, Manufacturer, Price
FROM phone
WHERE ProductCount > 2;

SELECT * 
FROM phone
WHERE Manufacturer = "Samsung";

SELECT * 
FROM phone
WHERE ProductName LIKE 'Iphone%';

SELECT * 
FROM phone
WHERE ProductName REGEXP '^Iphone';

SELECT * 
FROM phone
WHERE Manufacturer LIKE 'Samsung%';

SELECT * 
FROM phone
WHERE Manufacturer REGEXP '^Samsung';

SELECT * 
FROM phone
WHERE ProductName LIKE '%8%';

