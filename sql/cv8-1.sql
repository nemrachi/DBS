-- MySQL SELECT Statement --
SELECT * FROM sakila.actor;

USE sakila; -- You can make the sakila database the default database --> below usage

SELECT * FROM actor;

-- MySQL DISTINCT --
SELECT first_name 
FROM sakila.actor
WHERE first_name LIKE 'An%';

SELECT DISTINCT first_name 
FROM sakila.actor
WHERE first_name LIKE 'An%'; -- distinct - only uniq values selected

SELECT COUNT(DISTINCT first_name) 
FROM sakila.actor
WHERE first_name LIKE 'An%'; -- 3

SELECT COUNT(DISTINCTROW first_name) 
FROM sakila.actor
WHERE first_name LIKE 'An%'; -- DISTINCTROW == DISTINCT

SELECT COUNT(first_name) 
FROM sakila.actor
WHERE first_name LIKE 'An%'; -- 4

SELECT DISTINCT first_name, last_name
FROM sakila.actor
WHERE first_name LIKE 'An%';

-- MySQL WHERE Clause --
SELECT * FROM sakila.actor
WHERE first_name = 'nicky'; -- not case-sensitive

UPDATE sakila.actor
SET first_name = 'Nicky'
WHERE actor_id = 2; -- Without the WHERE clause, all records would be updated

-- MySQL ORDER BY Clause --
SELECT * from sakila.actor
ORDER BY actor_id;

SELECT * from sakila.actor
ORDER BY actor_id ASC; -- default for ORDER BY -- / vzostupne

SELECT * from sakila.actor
ORDER BY actor_id DESC; -- \ zostupne

SELECT * from sakila.actor
WHERE first_name LIKE 'An%'
ORDER BY first_name, last_name; -- ASC/DESC

-- MySQL GROUP BY Clause --
SELECT last_name 
FROM sakila.actor
GROUP BY last_name; -- if two actors have a last name of "Bailey", that last name is listed once only

SELECT last_name, COUNT(*) 
FROM sakila.actor
GROUP BY last_name;

SELECT 	c.customer_id AS 'Customer ID', 
		c.first_name AS 'First Name', 
		c.last_name AS 'Last Name', 
        SUM(amount) AS 'Total Paid'
FROM sakila.payment p
	INNER JOIN customer c ON
	p.customer_id = c.customer_id
GROUP BY c.customer_id; -- GROUP BY is used for data aggregation, using aggregate functions. such as SUM() , MIN() , MAX() , AVG() and COUNT()

-- MySQL HAVING Clause --
SELECT last_name, COUNT(*) 
FROM sakila.actor
GROUP BY last_name
HAVING COUNT(*) > 3; -- The HAVING clause can be used as a filter on a GROUP BY clause

SELECT 	c.customer_id AS 'Customer ID', 
		c.first_name AS 'First Name', 
		c.last_name AS 'Last Name', 
        SUM(amount) AS 'Total Paid'
FROM sakila.payment p
	INNER JOIN customer c ON
	p.customer_id = c.customer_id
GROUP BY c.customer_id
HAVING SUM(amount) > 180
ORDER BY SUM(amount) DESC;

-- MySQL DELETE Statement --
DELETE FROM sakila.actor
WHERE actor_id = 204;

DELETE FROM sakila.actor; -- Delete All Records

-- MySQL INSERT Statement --
INSERT INTO sakila.actor (first_name, last_name) 
VALUES ('Homer', 'Flinstone'); -- last_update = now

INSERT INTO sakila.actor
VALUES (202, 'Fred', 'Simpson', '2015-06-20 14:00:00'); -- last_update in query

INSERT INTO sakila.actor (first_name, last_name)
VALUES 
('Barney', 'Flinstone'),
('Marge', 'Rubble'),
('Bart', 'Griffin');

-- MySQL UPDATE Statement --
UPDATE sakila.actor
SET last_name = 'Flanders'
WHERE actor_id = 204;

UPDATE sakila.actor
SET first_name = 'Margarine', last_name = 'Burns'
WHERE actor_id = 204;