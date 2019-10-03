SELECT author_fname, author_lname, COUNT(*) FROM books GROUP BY author_lname;
SELECT COUNT(DISTINCT author_lname) FROM books;

SELECT COUNT(*) FROM books WHERE title LIKE '%the%';

SELECT author_lname, COUNT(*) FROM books GROUP BY author_lname;

SELECT author_fname, author_lname, COUNT(*) FROM books GROUP BY author_lname;

SELECT author_fname, author_lname, COUNT(*) FROM books GROUP BY author_lname, author_fname;

SELECT released_year, COUNT(*) FROM books GROUP BY released_year;

SELECT CONCAT('In ', released_year, ' ', COUNT(*), ' books', ' released') AS 'Books Date' FROM books GROUP BY released_year;

SELECT MIN(released_year) FROM books;

SELECT MAX(released_year) FROM books;
-- slow
SELECT * FROM books WHERE pages =(SELECT MIN(pages) FROM books);
-- fast
SELECT * FROM books ORDER BY pages ASC LIMIT 1;

SELECT author_fname, author_lname, MIN(released_year) FROM books GROUP BY author_fname, author_lname;

SELECT SUM(pages) FROM books;

SELECT author_fname, author_lname, SUM(pages) FROM books GROUP BY author_fname, author_lname;

SELECT AVG(pages) FROM books;
SELECT author_fname, author_lname, AVG(pages) FROM books GROUP BY author_fname, author_lname;

SELECT author_fname, author_lname, AVG(pages), SUM(pages), MIN(released_year) FROM books GROUP BY author_fname, author_lname;

SELECT author_fname, author_lname, released_year, AVG(stock_quantity), AVG(pages) FROM books GROUP BY released_year ORDER BY released_year ASC;

SELECT CONCAT(released_year, ' ', COUNT(*)) FROM books GROUP BY released_year ORDER BY released_year ASC;

SELECT author_lname, author_fname, pages FROM books ORDER BY pages DESC LIMIT 1;

SELECT released_year AS year, COUNT(*) AS '# books', AVG(pages) AS 'avg pages' FROM books GROUP BY released_year ORDER BY released_year ASC;


-- SELECT @@sql_mode;
-- SET GLOBAL sql_mode = ""; 
-- SET sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';