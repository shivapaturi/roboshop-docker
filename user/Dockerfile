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
ENV MONGO="true" \
    REDIS_URL="redis://redis:6379" \
    MONGO_URL="mongodb://mongodb:27017/users"
WORKDIR /opt/server
USER roboshop
COPY --from=builder --chown=roboshop:roboshop /opt/server /opt/server
CMD ["node", "server.js"]

# FROM node:20
# WORKDIR /opt/server
# ENV MONGO="true" \
#     REDIS_URL="redis://redis:6379" \
#     MONGO_URL="mongodb://mongodb:27017/users"
# COPY package.json .
# COPY *.js .
# RUN npm install
# CMD ["node","server.js"]

