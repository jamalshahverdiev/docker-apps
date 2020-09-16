FROM node:12-alpine
WORKDIR /usr/src/app
COPY ./sbs-ws-server .
COPY ./config.json .
RUN npm update && npm install && npm run build
CMD [ "npm", "start" ]
EXPOSE 3000/tcp
