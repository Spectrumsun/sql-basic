-- 'w%' start with w
-- '%w' end with w
-- '%w%' contains w

SELECT * FROM books WHERE released_year = 2017;
SELECT * FROM books WHERE released_year != 2017;

SELECT * FROM books WHERE author_fname LIKE '%da%';
SELECT * FROM books WHERE author_fname NOT LIKE '%da%';

SELECT * FROM books WHERE released_year > 2000;

SELECT * FROM books WHERE released_year >= 2000;

SELECT * FROM books WHERE released_year < 2000;

SELECT * FROM books WHERE released_year <= 2000;

SELECT * FROM books WHERE author_lname='Eggers' AND released_year > 2010;

SELECT * FROM books WHERE author_lname='Eggers' OR released_year > 2010;

SELECT * FROM books WHERE released_year >= 2010 AND released_year <= 2015;

SELECT * FROM books WHERE released_year BETWEEN 2010 AND 2015;

SELECT * FROM books WHERE released_year NOT BETWEEN 2010 AND 2015;

SELECT * FROM books WHERE released_year NOT BETWEEN CAST(2010 AS DATETIME) AND CAST(2015 AS DATETIME);

SELECT * FROM books WHERE author_lname IN ('carver', 'lahiri', 'smith');

SELECT * FROM books WHERE released_year NOT IN (200, 2002, 2004, 2006, 2008, 2010);

SELECT * FROM books WHERE released_year % 2 != 0;

SELECT title, released_year, 
  CASE 
    WHEN released_year >= 2000
    THEN 'Modern Lit' 
  ELSE '20th Centry Lit' 
  END AS Era FROM books;

SELECT title, released_year, 
  CASE 
    WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
    WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
    ELSE '***'
  END AS STOCK FROM books;

 SELECT title, released_year, 
  CASE 
    WHEN stock_quantity <= 50 THEN '*'
    WHEN stock_quantity <= 100 THEN '**'
    ELSE '***'
  END AS STOCK FROM books;



SELECT * FROM books WHERE released_year < 1980;

SELECT * FROM books WHERE author_lname = 'eggers' OR 'Chabon';
                           author_lname IN ('eggers',  'Chabon')


SELECT * FROM books WHERE author_lname = 'lahiri' AND released_year > 2000;

SELECT * FROM books WHERE pages BETWEEN 100 AND 200;

SELECT * FROM books WHERE author_lname LIKE 'C%' OR author_lname LIKE '%S';


 SELECT title, released_year, 
  CASE 
    WHEN title LIKE '%stories%' THEN 'Shot Stories'
    WHEN title IN ('Just Kids','A Heartbreaking Work of Staggering Genius') THEN 'Memoir'
    ELSE 'Novel'
  END AS Type FROM books;

SELECT title, author_lname, author_fname, COUNT(*) FROM books GROUP BY author_lname ORDER BY author_lname;

SELECT title, author_lname,
  CASE 
    WHEN COUNT(*) <= 1 THEN '1 Book'
    ELSE CONCAT(COUNT(*), 'Books')
  END AS 'Count'FROM books GROUP BY author_lname, author_fname ORDER BY author_lname;



