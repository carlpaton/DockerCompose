# Wait For

This is an attempt to create an elegant solution to 'wait for' container services to become available which is related to docker compose's startup order (depends_on)

## wait-for-db.sh

Wait until Postgres is definitely ready to accept commands. (This example is from docs.docker.com)

Add this to the service inside 'docker-compose.yml'

command: ["./wait-for-db.sh", "db", "python", "app.py"]

## wait-for-web.sh

This is to wait for a web application to become available based on a HTTP status code. Example check for any status code other than 404 (Not Found)

# References

* https://docs.docker.com/compose/startup-order/
* https://superuser.com/questions/569092/how-to-split-the-http-error-code-from-the-contents-in-curl
