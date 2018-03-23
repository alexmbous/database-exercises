USE ACadlister;

DROP TABLE IF EXISTS pivot_table;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS posts;



CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  email VARCHAR(240) NOT NULL,
  password VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE posts (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  title VARCHAR(240) NOT NULL,
  content TEXT NOT NULL,
  PRIMARY KEY (id)
);

#By using cascading referential integrity constraints, you can define the actions that the SQL Server takes when a user tries to delete or update a key to which existing foreign keys point. The REFERENCES clauses of the CREATE TABLE and ALTER TABLE statements support the ON DELETE and ON UPDATE clauses.
CREATE TABLE categories (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  type  VARCHAR(255),
  PRIMARY KEY (id)
);

CREATE TABLE pivot_table (
  post_id INTEGER UNSIGNED NOT NULL,
  cat_id INTEGER UNSIGNED NOT NULL,
  user_id INTEGER UNSIGNED NOT NULL,
  FOREIGN KEY (post_id) REFERENCES posts(id),
  FOREIGN KEY (cat_id) REFERENCES  categories(id),
  FOREIGN KEY (user_id) REFERENCES  users(id)
);







