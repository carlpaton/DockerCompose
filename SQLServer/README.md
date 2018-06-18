# SQL Server

1. Scripts to provision the database tables:
* dbo.fizzbuzz_event
* dbo.fizzbuzz_data

# fizzbuzz_event

This keeps the parameters the applications data was generated with. 

Example; lowerBound=1 upperBound=100 fizzAt=3 buzzAt=5

# fizzbuzz_data

This links to fizzbuzz_event.id and stores the generated data.

Example; 1 2 FIZZ 4 BUZZ FIZZ 7 8 FIZZ ... ect