# Stage 1: Builder
FROM python:3.9 AS builder
WORKDIR /opt/server
COPY requirements.txt .
RUN pip3 install -r requirements.txt
COPY payment.ini .
COPY *.py .

# Stage 2: Runtime
FROM python:3.9-slim
EXPOSE 8080

# Use Debian syntax for creating user and group
RUN groupadd -r roboshop && useradd -r -g roboshop roboshop

WORKDIR /opt/server
COPY --from=builder --chown=roboshop:roboshop /opt/server /opt/server/

USER roboshop
CMD ["uwsgi", "--ini", "payment.ini"]

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