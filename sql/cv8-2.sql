-- MySQL CHAR_LENGTH() Function --
-- CHARACTER_LENGTH() == CHAR_LENGTH() = Returns the number of characters in its argument
-- OCTET_LENGTH() == LENGTH() = Returns the length of a string in bytes (not the number of characters).
SELECT 
	title, 
    CHAR_LENGTH(title),
    CHARACTER_LENGTH(title) -- the same thing
FROM film;

SELECT 
	title Title_1, 
    CHAR_LENGTH(title) Length,   
	IF(CHAR_LENGTH(title) > 15,
	CONCAT(LEFT(title,15), '...'), title) Title_2
FROM sakila.film; -- if statement

