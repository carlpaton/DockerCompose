# Docker Compose
Collaborative project to demonstrate the power of docker compose.

The project is made up of the following containers:

1. compose-mssql
* microsoft/mssql-server-linux:2017-CU5

2. compose-flyway-git-clone
* clones SQL scripts from https://github.com/charleyza/SQLStatements/tree/master/ComposeDemo
* copys them to a volume used by flyway

3. compose-flyway-baseline
* base lines the database

4. compose-flyway-migrate
* applys the SQL migrations based on the SQL scripts cloned/copied in step 2
* dbo.fizzbuzz_event ~ This keeps the parameters the applications data was generated with. Example; lowerBound=1 upperBound=100 fizzAt=3 buzzAt=5
* dbo.fizzbuzz_data ~ This links to fizzbuzz_event.id and stores the generated data. Example; 1 2 FIZZ 4 BUZZ FIZZ 7 8 FIZZ ... ect

5. compose-web-api (TODO)
* Methods to PUT and GET data
* microsoft/dotnet:2.0-sdk

6. compose-fizzbuzz-generator (TODO)
* Generates the data, calls the WEB API PUT method
* https://github.com/charleyza/FizzBuzz

7. compose-web (TODO)
* Angular Web Application to GET and display the data

8. compose-console-app (TODO)
* Console application to GET and display the data
