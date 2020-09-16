FROM node:12-alpine
WORKDIR /usr/src/app
COPY Reactor/src/Controller/ ./
RUN npm install -g apidoc http-server
RUN apidoc -i "./v1" -o "./apidoc" && rm -rf $(ls | grep -v apidoc) && mv apidoc/* .
CMD [ "http-server", "-p", "3007" ]
EXPOSE 3007/tcp
