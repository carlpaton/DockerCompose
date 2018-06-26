# Docker Compose
Collaborative project to demonstrate the power of docker compose and Infrastructure as code (IaC)

To spin up the entire echo-system run ./compose.sh 

This script makes use of the following containers/steps:

1. compose-db
* postgres:9.6-alpine

NOTE:

The db container is first run in detached mode, this is to give the database server a chance to start up.
Docker documentation says applications need to be resilient and have their own re retry mechanisms built in so they will not be adding any 'wait' in the compose process.

~ https://docs.docker.com/compose/compose-file/#depends_on
~ https://docs.docker.com/compose/startup-order/

Flyway simply states we must start the database and wait for it -_-

~ https://store.docker.com/community/images/boxfuse/flyway

2. compose-flyway-git-clone
* flyway-git-clone/Dockerfile
* clones SQL scripts from https://github.com/charleyza/SQLStatements/tree/master/
* copys them to a volume used by flyway

To create new layers it runs as 'docker-compose build --no-cache'

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
