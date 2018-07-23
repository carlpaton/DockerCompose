# Docker Compose

Collaborative project to demonstrate the power of docker compose and Infrastructure as code (IaC)

To spin up the entire echo-system run ./compose.sh 

Once you have run ./compose.sh above and then stop the services for what ever reason you can start just the Database and API with ./start.sh

This script ./compose.sh  makes use of the following containers/steps:

## compose-db

* postgres:9.6-alpine
* from my notebook I could connect to http://172.29.5.197:54320/

NOTE:

The db container is first run in detached mode, this is to give the database server a chance to start up.
Docker documentation says applications need to be resilient and have their own re retry mechanisms built in so they will not be adding any 'wait' in the compose process.

~ https://docs.docker.com/compose/compose-file/#depends_on

~ https://docs.docker.com/compose/startup-order/

Flyway simply states we must start the database and wait for it -_-

~ https://store.docker.com/community/images/boxfuse/flyway

## compose-flyway-git-clone

* flyway-git-clone/Dockerfile
* clones SQL scripts from https://github.com/charleyza/SQLStatements/tree/master/
* copys them to a volume used by flyway

To create new layers it runs as 'docker-compose build --no-cache'

## compose-flyway-baseline

* base lines the database

## compose-flyway-migrate

* applys the SQL migrations based on the SQL scripts cloned/copied in step 2
* dbo.fizzbuzz_event ~ This keeps the parameters the applications data was generated with. Example; lowerBound=1 upperBound=100 fizzAt=3 buzzAt=5
* dbo.fizzbuzz_data ~ This links to fizzbuzz_event.id and stores the generated data. Example; 1 2 FIZZ 4 BUZZ FIZZ 7 8 FIZZ ... ect

## compose-api (postgrest)

* https://postgrest.org/en/v5.0/install.html#docker
* https://www.postgresql.org/docs/9.6/static/index.html
* https://store.docker.com/community/images/postgrest/postgrest

Testing & Dev

* from my notebook I could connect to http://172.29.5.197:3000/
* https://postgrest.org/en/v5.0/api.html#insertions-updates

### fizzbuzz_event

To insert:

* POST : http://172.29.5.197:3000/fizzbuzz_event
* HEADER : Content-Type=application/json
* BODY: { "lower_bound": "1", "upper_bound": "1", "fizz_at": "3", "buzz_at": "5" }

To read the record and get its ID

* GET : http://172.29.5.197:3000/fizzbuzz_event?order=id.desc&limit=1

Example response

[{"id":3,"lower_bound":1,"upper_bound":1,"fizz_at":3,"buzz_at":5,"insert_date":"2018-06-27T12:38:50.016657"}]

### fizzbuzz_data

* POST : http://172.29.5.197:3000/fizzbuzz_data
* HEADER : Content-Type=application/json
* BODY: 

[
  { "fizzbuzz_event_id": "1", "val": "1" },
  { "fizzbuzz_event_id": "1", "val": "2" },
  { "fizzbuzz_event_id": "1", "val": "FIZZ" }
]

## compose-fizzbuzz-generator

* Generates the data, calls the WEB API PUT method
* https://github.com/charleyza/FizzBuzz
* v1.1.0 has the API call support provided 'apiUrl' is set when calling docker compose

## compose-web

* Angular Web Application to GET and display the data
* GET : http://172.29.5.197:3000/fizzbuzz_data
* Built following ~ https://www.w3schools.com/angular/angular_http.asp

From my notebook I could then see http://172.29.5.197:8080/
