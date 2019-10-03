CREATE TABLE cats(
  cat_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  name VARCHAR(100),
  breed VARCHAR(100),
  age INT
);
INSERT INTO
  cats(name, breed, age)
VALUES('Ringo', 'Tabby', 4),
  ('Cindy', 'Maine coon', 10),
  ('Egg', 'Persian', 4),
  ('Dumbledore', 'Maine Coon', 11),
  ('Misty', 'Tabby', 13),
  ('George Michael', 'Ragdoll', 9),
  ('Jackson', 'Sphynx', 7); 

SELECT * FROM cats;

SELECT name FROM cats;
SELECT age FROM cats;

SELECT name, age FROM cats;

SELECT * FROM cats WHERE cat_id=1;
SELECT * FROM cats WHERE name='tom';
SELECT name, age FROM cats WHERE breed='tabby';

SELECT cat_id, age FROM cats WHERE cat_id=age;
SELECT * FROM cats WHERE cat_id=age;

SELECT cat_id AS id, name  FROM cats;

UPDATE cats SET breed='Shorthair' WHERE breed='Tabby';

UPDATE cats SET age=14 WHERE name='Misty';

DELETE FROM cats WHERE name='egg'; 
DELETE FROM cats;
