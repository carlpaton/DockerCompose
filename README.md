# DockerCompose
Collaborative project to demonstrate the power of docker compose.

The project is made up of the following containers:

1. SQL Server
.1 to persist and retireve data
.2 provision tables, possible flyway script or from the WEB API

2. WEB API
.1 Methods to PUT and GET data

3. FizzBuzz Generator
.1 Generates the data, calls the WEB API PUT method

4. Front End
.1 Angular Web Application to GET and display the data
