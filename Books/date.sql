CREATE TABLE test_times 
    (
        id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(100),
        b_time TIME,
        b_date DATE,
        b_date_time DATETIME
    );

    INSERT INTO test_times (name, b_time, b_date, b_date_time) VALUES(
      'tommy',
      '10:10:10',
      '2019-09-20',
      '2019-09-20 10:10:10'
    );

      INSERT INTO test_times (name, b_time, b_date, b_date_time) VALUES(
      'tommy',
      CURTIME(),
      CURDATE(),
      NOW()
    );

SELECT name, DAY(b_date_time) FROM test_times;

SELECT name, DATE_FORMAT(b_date_time, '%W') FROM test_times;

SELECT name, DATE_FORMAT(b_date_time, '%W %M %Y') FROM test_times;

SELECT name, DATE_FORMAT(b_date_time, '%W - %M - %Y') FROM test_times;

SELECT name, DATE_FORMAT(b_date_time, '%m/%d/%Y') FROM test_times;


SELECT DATEDIFF(NOW(), b_date_time) FROM test_times;

SELECT DATEDIFF(NOW(), b_date_time) FROM test_times;


CREATE TABLE comments 
    (
        id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        commet VARCHAR(100),
        created_at TIMESTAMP NOT NULL DEFAULT NOW(),
        updated_at TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW()
    );


INSERT INTO comments (commet) VALUES('tommy is a funny girl');

INSERT INTO comments (commet) VALUES('go play with your self');

SELECT *, DATE_FORMAT(created_at, '%m/%d/%Y') FROM comments;




--  if you’re stuck on MySQL 5.5
-- CREATE TRIGGER orders__before_insert
-- BEFORE INSERT ON orders
-- FOR EACH ROW SET NEW.created_at = NOW(), NEW.updated_at = NOW();

-- CREATE TRIGGER orders__before_update
-- BEFORE UPDATE ON orders
-- FOR EACH ROW SET NEW.created_at = OLD.created_at, NEW.updated_at = NOW();

SELECT CURDATE();
SELECT CURTIME();
SELECT NOW();
SELECT DATE_FORMAT();