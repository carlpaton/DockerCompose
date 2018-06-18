CREATE TABLE fizzbuzz_event (
  id int IDENTITY(1,1) PRIMARY KEY,
  lower_bound int NOT NULL,
  upper_bound int NOT NULL,
  fizz_at int NOT NULL,
  buzz_at int NOT NULL,  
  insert_date DATETIME DEFAULT GETDATE());