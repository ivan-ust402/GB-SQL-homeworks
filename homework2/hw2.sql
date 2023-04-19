CREATE DATABASE homework2db;

USE homework2db;

### Первое задание 
CREATE TABLE sales
(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
order_date DATE NOT NULL,
bucket VARCHAR(40)
);

INSERT INTO sales
(order_date, bucket)
VALUES
("2021-01-01","101 to 300"),
("2021-01-02","101 to 300"),
("2021-01-03","less than equal to 100"),
("2021-01-04","101 to 300"),
("2021-01-05","greater than 300");


### Второе задание
ALTER TABLE sales
ADD bucket_describ VARCHAR(40) NOT NULL;

UPDATE sales 
SET bucket_describ = 'Маленький заказ' 
WHERE bucket = 'less than equal to 100'; 

UPDATE sales 
SET bucket_describ = 'Средний заказ' 
WHERE bucket = '101 to 300';

UPDATE sales 
SET bucket_describ = 'Большой заказ' 
WHERE bucket = 'greater than 300';

SELECT * FROM sales;
-- DROP TABLE sales;

### Третье задание
CREATE TABLE orders
(
order_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
employee_id VARCHAR(40) NOT NULL,
amount DECIMAL(5,2),
order_status VARCHAR(10) NOT NULL
);

INSERT INTO orders
(employee_id, amount, order_status)
VALUE
("e03", 15.00, "OPEN"),
("e01", 25.50, "OPEN"),
("e05", 100.70, "CLOSED"),
("e02", 22.18, "OPEN"),
("e04", 9.50, "CANCELLED"),
("e04", 99.99, "OPEN");

SELECT * FROM orders;
-- DROP TABLE orders;

SELECT order_id, order_status,
CASE order_status
	WHEN "OPEN" THEN "Order is in open state."
	WHEN "CLOSED" THEN "Order is closed."
    WHEN "CANCELLED" THEN "Order is cancelled."
END AS order_summary
FROM orders;

### Четвертое задание
/*
Отличие NULL от 0
NULL - трактуется, как "значение не опеределено".
При сравнении NULL с любым значением будет получен результат NULL, 
а не FALSE и не 0. 
NULL != NULL.
*/




