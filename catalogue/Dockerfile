FROM node:20-alpine3.21

RUN addgroup -S roboshop && \
    adduser -S roboshop -G roboshop

WORKDIR /opt/server

COPY package.json .

RUN npm install

COPY *.js .

RUN chown -R roboshop:roboshop /opt/server

ENV MONGO="true" \
    MONGO_URL="mongodb://mongodb:27017/catalogue"

USER roboshop

CMD ["node", "server.js"]