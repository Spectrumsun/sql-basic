SHOW DATABASES;
CREATE DATABASE test_database;
USE test_database;
SHOW TABLES;
CREATE TABLE employees(
  id INT PRIMARY KEY NOT NULL,
  name VARCHAR(50) DEFAULT 'lol'
);
INSERT INTO
  employees (name)
VALUES('James');
DESC employees;
SELECT
  *
FROM
  employees;
DROP TABLE employees;
DROP DATABASE test_database;





create user nodeuser@localhost identified by 'nodeuser@1234';

grant all privileges on node.* to nodeuser@localhost;

ALTER USER 'sunday'@localhost IDENTIFIED WITH mysql_native_password BY 'docker';

FLUSH PRIVILEGES;