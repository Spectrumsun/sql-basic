CREATE TABLE books 
    (
        book_id INT NOT NULL AUTO_INCREMENT,
        title VARCHAR(100),
        author_fname VARCHAR(100),
        author_lname VARCHAR(100),
        released_year INT,
        stock_quantity INT,
        pages INT,
        PRIMARY KEY(book_id)
    );

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);


SELECT database();

CREATE DATABASE book_shop;

use book_shop;

show tables;

source book_data.sql

DESC books;

SELECT * FROM books;

SELECT CONCAT(author_fname, author_lname) FROM books;

SELECT CONCAT(author_fname,' ', author_lname) FROM books;
SELECT CONCAT(author_fname,' ', author_lname) AS fullname FROM books;

SELECT author_fname AS First, author_lname AS Last, CONCAT(author_fname,' ', author_lname) AS fullname FROM books;

SELECT CONCAT_WS('-', title, author_fname,' ', author_lname) AS fullname FROM books;

SELECT SUBSTRING(title, 1, 3) FROM books;
SELECT SUBSTRING(title, 3) FROM books WHERE book_id=1;

SELECT CONCAT(SUBSTRING(title, 1, 7) , '....') AS 'Short title' FROM books;

SELECT REPLACE(title, 'a', 'LOL') AS 'Short title' FROM books;

SELECT REVERSE(title) FROM books;

SELECT title, CHAR_LENGTH(title) AS 'title Length'FROM books;

SELECT CONCAT(author_lname, ' is ', CHAR_LENGTH(author_lname), ' characters long') FROM books;


SELECT UPPER(author_lname) AS forwards, LOWER(author_lname) AS backwards FROM books;


SELECT REPLACE(title, ' ', '->') FROM books;

SELECT CONCAT(UPPER(author_fname), ' ', UPPER(author_lname)) AS 'full name in caps' FROM books;


SELECT CONCAT(title, ' was released in ', released_year) AS 'blurb' FROM books;

SELECT title AS 'title', CHAR_LENGTH(title) AS 'character count' FROM books;

SELECT CONCAT(SUBSTRING(title, 1, 10), '....') AS 'Shot title', CONCAT(author_lname,author_fname) AS author, CONCAT(stock_quantity, ' in stock') AS quantity FROM books;




INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);


SELECT book_id, title FROM books;

SELECT DISTINCT author_lname FROM books;
SELECT DISTINCT author_lname, author_fname FROM books;

SELECT * FROM books ORDER BY stock_quantity DESC;

SELECT * FROM books ORDER BY stock_quantity ASC;

SELECT title, author_fname, author_lname FROM books ORDER BY 2;

SELECT title, author_fname, author_lname, released_year FROM books ORDER BY author_fname, author_lname;


SELECT * FROM books LIMIT 3;

SELECT book_id, title, released_year FROM books ORDER BY book_id DESC LIMIT 4, 7;

SELECT book_id, title, released_year FROM books ORDER BY book_id LIMIT 6, 10;

SELECT * FROM books WHERE author_fname LIKE '%da%';

SELECT * FROM books WHERE author_fname LIKE 'da%';

SELECT * FROM books WHERE stock_quantity LIKE '____%';


SELECT title FROM books WHERE title LIKE '%stories%';

SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;

SELECT CONCAT(title, ' - ', released_year) AS summary FROM books ORDER BY released_year DESC LIMIT 3;

SELECT title, author_lname FROM books WHERE author_lname LIKE '% %';


SELECT title, author_lname FROM books ORDER BY author_lname;

SELECT CONCAT('MY FAVORITE AUTHOR IS ', author_fname, ' ', author_lname, '!') AS yell FROM books ORDER BY author_lname;

