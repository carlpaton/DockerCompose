#!/bin/bash
sudo docker pull microsoft/mssql-server-linux:2017-CU5
sudo docker container kill compose-mssql
sudo docker rm compose-mssql
sudo docker run --name=compose-mssql -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=Password123' -e 'MSSQL_PID=Express' -p 62000:1433 -d microsoft/mssql-server-linux:2017-CU5
sudo docker start compose-mssql
sudo docker ps --all