FROM alpine:3.7
VOLUME /compose_flyway_data
RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh
RUN mkdir data && \
    git clone https://github.com/charleyza/SQLStatements.git data && \
    cp /data/ComposeDemo/*.sql /compose_flyway_data