CREATE TABLE customers 
    (
        id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        first_name VARCHAR(100) NOT NULL,
        last_name VARCHAR(100) NOT NULL,
        email VARCHAR(50) NOT NULL,
        created_at TIMESTAMP NOT NULL DEFAULT NOW(),
        updated_at TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW()
    );


CREATE TABLE orders 
    (
        id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        order_date DATE NOT NULL,
        amount DECIMAL(8,2) NOT NULL,
        customer_id INT NOT NULL,
        FOREIGN KEY(customer_id) REFERENCES customers(id) ON DELETE CASCADE,
        created_at TIMESTAMP NOT NULL DEFAULT NOW(),
        updated_at TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW()
    );



INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');


INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);


SELECT * FROM orders WHERE customer_id = (
  SELECT id FROM customers WHERE last_name = 'george'
);

--  inner join
SELECT * FROM customers, orders WHERE customers.id = orders.customer_id;

SELECT * FROM customers JOIN orders ON customers.id = orders.customer_id;

SELECT * FROM customers INNER JOIN orders ON customers.id = orders.customer_id;

SELECT 
  first_name, 
  last_name, 
  order_date,
  SUM(amount) AS total_spent
  FROM customers 
  JOIN orders ON customers.id = orders.customer_id
  GROUP BY orders.customer_id
  ORDER BY total_spent DESC;


  -- LEFT JOIN
SELECT * FROM customers LEFT JOIN orders ON customers.id = orders.customer_id;

SELECT 
  first_name, 
  last_name, 
  order_date,
  SUM(amount) AS total_spent
  FROM customers 
  LEFT JOIN orders ON customers.id = orders.customer_id
  GROUP BY customers.id
  ORDER BY total_spent DESC;


SELECT 
  first_name, 
  last_name, 
  order_date,
  IFNULL(SUM(amount), 0) AS total_spent
  FROM customers 
  LEFT JOIN orders ON customers.id = orders.customer_id
  GROUP BY customers.id
  ORDER BY total_spent DESC;



  -- RIGHT JOIN
SELECT * FROM customers RIGHT JOIN orders ON customers.id = orders.customer_id;

SELECT * FROM orders RIGHT JOIN customers ON customer_id = customers.id;


 

 CREATE TABLE students 
    (
        id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        first_name VARCHAR(100) NOT NULL,
        created_at TIMESTAMP NOT NULL DEFAULT NOW(),
        updated_at TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW()
    );


CREATE TABLE papers 
    (
        id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        title VARCHAR(100) NOT NULL,
        grade INT NOT NULl,
        student_id INT NOT NULL,
        FOREIGN KEY(student_id) REFERENCES students(id) ON DELETE CASCADE,
        created_at TIMESTAMP NOT NULL DEFAULT NOW(),
        updated_at TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW()
    );

INSERT INTO students (first_name) 
VALUES ('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);



SELECT first_name FROM students;

SELECT 
  first_name, 
  title, grade 
  FROM students 
  JOIN papers 
  ON students.id = papers.student_id 
  ORDER BY grade DESC;

SELECT 
  first_name, 
  title, 
  IFNULL(grade, 0) 
  FROM students 
  LEFT JOIN papers 
  ON students.id = papers.student_id 
  ORDER BY grade DESC;


SELECT 
  first_name, 
  AVG(IFNULL(grade, 0)) 
  AS average 
  FROM students 
  LEFT JOIN papers 
  ON students.id = papers.student_id 
  GROUP BY first_name ORDER BY grade DESC;

SELECT 
  first_name, 
  AVG(IFNULL(grade, 0))
  AS average,
    CASE 
    WHEN AVG(grade) >= 75 THEN 'PASSING'
    ELSE 'FAILING'
  END AS 'Passing_status'
  FROM students 
  LEFT JOIN papers 
  ON students.id = papers.student_id 
  GROUP BY first_name ORDER BY grade DESC;