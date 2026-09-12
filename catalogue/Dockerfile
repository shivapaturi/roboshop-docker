# Stage 1: Builder

FROM node:20-alpine3.21 AS builder

WORKDIR /opt/server

COPY package.json .

RUN npm install

COPY *.js .

# Stage 2: Runtime

FROM node:20-alpine3.21

RUN addgroup -S roboshop && \
    adduser -S roboshop -G roboshop

WORKDIR /opt/server

COPY --from=builder /opt/server /opt/server

RUN chown -R roboshop:roboshop /opt/server

ENV MONGO="true" \
    MONGO_URL="mongodb://mongodb:27017/catalogue"

USER roboshop

CMD ["node", "server.js"]

# FROM node:20-alpine3.21

# RUN addgroup -S roboshop && \
#     adduser -S roboshop -G roboshop

# WORKDIR /opt/server

# COPY package.json .

# RUN npm install

# COPY *.js .

# RUN chown -R roboshop:roboshop /opt/server

# ENV MONGO="true" \
#     MONGO_URL="mongodb://mongodb:27017/catalogue"

# USER roboshop

# CMD ["node", "server.js"]