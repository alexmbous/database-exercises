USE codeup_test_db;
DROP TABLE IF EXISTS codeup_test_db;
CREATE TABLE Pizza_Order (
  user_name VARCHAR(100) NOT NULL,
  user_phone_number VARCHAR(100) NOT NULL,
  user_email VARCHAR(100),
  user_address VARCHAR(1000) NOT NULL,
  pizza_size VARCHAR(10) NOT NULL,
  total_cost DECIMAL(4,2) NOT NULL,
  order_description VARCHAR(1000) NOT NULL,
  isDelivered BOOLEAN NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (user_name)
);
