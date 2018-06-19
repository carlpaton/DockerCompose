FROM alpine:3.7
VOLUME /compose_flyway_data
VOLUME /flyway/sql
RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh
RUN git clone https://github.com/charleyza/SQLStatements.git /compose_flyway_data
COPY /compose_flyway_data/ComposeDemo /flyway/sql
