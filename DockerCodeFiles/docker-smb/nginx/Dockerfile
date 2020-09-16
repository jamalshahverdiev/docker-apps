FROM alpine:3.8

MAINTAINER Vincent Composieux <vincent.composieux@gmail.com>

RUN apk add --update --no-cache nginx

COPY ["nginx.conf", "mime.types", "/etc/nginx/"]
COPY ["symfony.conf", "app.conf", "sbswssrv.conf", "apidoc.conf", "hrmdoc.conf", "/etc/nginx/conf.d/"]
COPY certs/ /etc/nginx/certs/
#RUN echo "upstream php-upstream { server php:9001; }" > /etc/nginx/conf.d/upstream.conf
RUN adduser -D -g '' -G www-data www-data
CMD ["nginx"]

EXPOSE 80
EXPOSE 443
