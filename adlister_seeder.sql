USE ACadlister;

INSERT INTO users(email,password)
VALUES
  ('chrisallen@gmail.com', 'password'),
  ('alexbous@gmail.com', 'pass'),
  ('thisisaperson@gmail.com', 'thisisapassword');

INSERT INTO categories(type)
VALUES('sports'),('auto'),('electronics'),('furniture');

INSERT INTO posts(title, content)
VALUES('White Leather Sofa', 'I GOTTA NICE LEATHER SOFA WITH SOME HOLES IN IT'),
  ('Tennis Racket', 'Tennis racket for sale with a bunch of little holes in it'),
  ('Flat Screen TV', 'Shit kinda works!'),
  ('Used Mattress', 'You know you want it'),
  ('Ipad 2', 'Screen is cracked but it sitl works'),
  ('Xbox 360', 'Has the red ring of death'),
  ('PS4', 'Brand new Condition'),
  ('Longboard', 'has 3 wheels on it'),
  ('Semi-Truck', 'It\'s a big rig'),
  ('Dirtbike', 'Rides like it should'),
  ('gamboy', 'oldschool gamers need this.'),
  ('lawnmower', 'a good mower?'),
  ('baseball cards', 'the best cards in town'),
  ('rugby ball', 'flat but still works'),
  ('football helmet', 'only wore once'),
  ('baseball mit', 'never used. kid hates baseball'),
  ('ps4', 'only seriouse buyers'),
  ('oldschool nintedno', 'a few games available with purchase'),
  ('tires for a truck', '4 tires for a toyota tundra'),
  ('flat screen tv', 'one year old samsung.'),
  ('ducati motorcyle', '50k miles'),
  ('el camino', 'business in the front and party in the back. 250k miles'),
  ('BIKES!', 'I HAVE A NICE BIKE FOR SALE, WOULD YOU LIKE TO BUY MY NICE BIKE?'),
  ('HONDA', 'I GOT A HONDA FOR SALE YO!'),
  ('MACBOOK', 'SHIT STILL WORKS');

#('sports'),('auto'),('electronics'),('furniture');

INSERT INTO pivot_table(user_id, post_id, cat_id)
VALUES (1,1,4),(1,2,1),(1,3,3),(1,4,4),(1,5,3),(1,6,3),(1,7,3),(1,8,1),(1,9,2),(2,10,1),(2,11,3),(2,12,2),
  (2,13,1),(2,14,1),(2,15,1),(2,16,1),(2,17,3),(2,18,3),(2,19,2),(3,20,3),(3,21,2),(3,22,2),(3,23,1),(3,24,2),(3,25,3);



#For a given ad, what is the email address of the user that created it?

SELECT  email
FROM users u
  JOIN pivot_table pt ON pt.user_id = u.id
  JOIN posts p ON p.id = pt.post_id
  JOIN categories c ON c.id = pt.cat_id
WHERE p.title = "SEmi-Truck";




#For a given ad, what category, or categories, does it belong to?
SELECT  type
FROM users u
  JOIN pivot_table pt ON pt.user_id = u.id
  JOIN posts p ON p.id = pt.post_id
  JOIN categories c ON c.id = pt.cat_id
WHERE p.title = "Semi-Truck";



#For a given category, show all the ads that are in that category.

SELECT title
FROM categories c
  JOIN pivot_table pt ON pt.cat_id = c.id
  JOIN posts p ON p.id = pt.post_id
WHERE type = 'Sports';

#For a given user, show all the ads they have posted

SELECT title,content
FROM users u
  JOIN pivot_table pt ON pt.user_id = u.id
  JOIN posts p ON p.id = pt.post_id
WHERE u.id = 3;


