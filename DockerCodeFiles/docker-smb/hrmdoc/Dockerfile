FROM node:12-alpine
WORKDIR /usr/src/app
COPY Reactor/src/Controller/v1/HRM/ ./
RUN npm install -g apidoc http-server
RUN apidoc -i "./" -o "./hrmdoc" && rm -rf $(ls | grep -v hrmdoc) && mv hrmdoc/* .
CMD [ "http-server", "-p", "3008" ]
EXPOSE 3008/tcp
