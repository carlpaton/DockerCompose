CREATE TABLE fizzbuzz_data (
  id int IDENTITY(1,1) PRIMARY KEY,
  fizzbuzz_event_id int FOREIGN KEY REFERENCES fizzbuzz_event(id),
  val VARCHAR(8) NULL);
