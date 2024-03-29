DROP TABLE students;
DROP TABLE houses;



CREATE TABLE houses (
  id serial4 PRIMARY KEY,
  name VARCHAR(255),
  logo VARCHAR(255)
);

CREATE TABLE students (
  id serial4 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  age INT4,
  house_id INT8 REFERENCES houses(id)
);
