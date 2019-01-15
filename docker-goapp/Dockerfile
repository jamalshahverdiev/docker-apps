FROM golang:alpine AS build-env
WORKDIR /app
ADD . /app
RUN apk add --no-cache --virtual .build-deps bash gcc musl-dev openssl go 
RUN cd /app && go build -o gowebapp

FROM alpine 
RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk/*
WORKDIR /app
COPY --from=build-env ["/app/gowebapp", "/app/*.html", "/app/"]

EXPOSE 8080
ENTRYPOINT ./gowebapp
