FROM alpine:3.7

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

RUN git clone https://github.com/charleyza/SQLStatements.git git_data && \
    mkdir -p flyway/sql && \
    cp git_data/postgresql/ComposeDemo/*.sql flyway/sql/