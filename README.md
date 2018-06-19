# Docker Compose
Collaborative project to demonstrate the power of docker compose.

The project is made up of the following containers:

1. SQL Server
* SQL Database 
* microsoft/mssql-server-linux:2017-CU5

2. Flyway
* To provision SQL Server
* https://github.com/charleyza/SQLStatements/tree/master/ComposeDemo

2. WEB API
* Methods to PUT and GET data
* microsoft/dotnet:2.0-sdk

3. FizzBuzz Generator
* Generates the data, calls the WEB API PUT method
* https://github.com/charleyza/FizzBuzz

4. Front End
* Angular Web Application to GET and display the data

5. Front End Console Application
* Console application to GET and display the data
