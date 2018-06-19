FROM alpine:3.7
VOLUME /compose_flyway_data
VOLUME /flyway/sql
RUN mkdir /data
RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh
RUN git clone https://github.com/charleyza/SQLStatements.git /data
#COPY /data/ComposeDemo/V1.0.1__fizzbuzz_event.sql /flyway/sql/V1.0.1__fizzbuzz_event.sql
