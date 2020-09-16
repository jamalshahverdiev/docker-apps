FROM node:12-alpine
WORKDIR /usr/src/app
COPY ./reactive-smb .
RUN npm install
COPY ./env ./.env
RUN npm run build
CMD [ "npm", "run", "server" ]
EXPOSE 3005/tcp
