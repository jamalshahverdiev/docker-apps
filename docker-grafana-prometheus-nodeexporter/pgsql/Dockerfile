FROM postgres:alpine
RUN apk add netcat-openbsd curl
ADD ./init /docker-entrypoint-initdb.d/
