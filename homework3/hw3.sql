CREATE DATABASE homework3db;

USE homework3db;


### ЗАДАНИЕ 1

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

# 3. Напишите запрос, который вывел бы значения snum всех продавцов из таблицы 
#    заказов без каких бы то ни было повторений. (уникальные значения в  “snum“ 
#    “Продавцы”)

SELECT DISTINCT sname
FROM salespeople;

# 4*. Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с 
#     буквы G. Используется оператор "LIKE": (“заказчики”) 
#     https://dev.mysql.com/doc/refman/8.0/en/string-comparison-functions.html

SELECT * 
FROM customers
WHERE cname LIKE "G%";

# 5. Напишите запрос, который может дать вам все заказы со значениями 
#    суммы выше чем $1,000. (“Заказы”, “amt”  - сумма)

SELECT * 
FROM orders
WHERE amt > 1000;

# 6. Напишите запрос который выбрал бы наименьшую сумму заказа.
#    (Из поля “amt” - сумма в таблице “Заказы” выбрать наименьшее значение)

SELECT MIN(amt)
FROM orders;

# 7. Напишите запрос к таблице “Заказчики”, который может показать всех 
#    заказчиков, у которых рейтинг больше 100 и они находятся не в Риме.

SELECT *
FROM customers
WHERE rating > 100 AND city = "Rome";

### ЗАДАНИЕ 2

CREATE TABLE employee
(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
firstname VARCHAR(40) NOT NULL,
surname VARCHAR(40) NOT NULL,
specialty VARCHAR(40) NOT NULL,
seniority INT NOT NULL,
salary INT NOT NULL, 
age INT NOT NULL
);

INSERT INTO employee
(firstname, surname, specialty, seniority, salary, age)
VALUE
("Вася", "Васькин", "начальник", 40, 100000, 60),
("Петя", "Петькин", "начальник", 8, 70000, 30),
("Катя", "Катькина", "инженер", 2, 70000, 25),
("Саша", "Сашкин", "инженер", 12, 50000, 35),
("Иван", "Иванов", "рабочий", 40, 30000, 59),
("Петр", "Петров", "рабочий", 20, 25000, 40),
("Сидор", "Сидоров", "рабочий", 10, 20000, 35),
("Антон", "Антонов", "рабочий", 8, 19000, 28),
("Юра", "Юркин", "рабочий", 5, 15000, 25),
("Максим", "Воронин", "рабочий", 2, 11000, 22),
("Юра", "Галкин", "рабочий", 3, 12000, 24),
("Люся", "Люськина", "уборщик", 10, 10000, 49);

-- DROP TABLE employee;
SELECT * FROM employee;

# 1. Отсортируйте поле “зарплата” в порядке убывания и возрастания

SELECT * 
FROM employee
ORDER BY salary DESC;

SELECT * 
FROM employee
ORDER BY salary ASC;

# 2. ** 

WITH SRC AS (
        -- Получаем 5 последних строк в таблице
        SELECT *
        FROM employee
        ORDER BY salary DESC
        LIMIT 5
)
SELECT * FROM SRC
ORDER BY salary; -- Применяем нужную нам сортировку

# 3. Выполните группировку всех сотрудников по специальности ,
#    суммарная зарплата которых превышает 100000

SELECT 
	GROUP_CONCAT(" ", firstname) as employees_names, 
    specialty, 
    SUM(salary) as sum_salary 
FROM employee
GROUP by specialty
HAVING sum_salary > 100000;

