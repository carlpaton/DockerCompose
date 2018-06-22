FROM alpine:3.7

#VOLUME /compose_flyway_data
VOLUME flyway/sql

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

RUN mkdir data && \
    git clone https://github.com/charleyza/SQLStatements.git data && \
    cp /data/ComposeDemo/*.sql /flyway/sql