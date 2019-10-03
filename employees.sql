CREATE TABLE employees(
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  last_name VARCHAR(50) NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  middle_name VARCHAR(50) NOT NULL,
  age INT NOT NULL,
  current_status VARCHAR(50) NOT NULL DEFAULT 'employed',
);

INSERT INTO
  employees(first_name, last_name, age,)

  