USE codeup_test_db;
DROP TABLE IF EXISTS codeup_test_db;
CREATE TABLE albums (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  artist VARCHAR(100) NOT NULL,
  name VARCHAR(100) NOT NULL,
  release_date YEAR(4),
  sales FLOAT NOT NULL,
  genre VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);