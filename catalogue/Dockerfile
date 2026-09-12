# Stage 1: Builder
FROM python:3.9 AS builder
WORKDIR /opt/server
COPY requirements.txt .
COPY payment.ini .
COPY *.py .
RUN pip3 install -r requirements.txt

# Stage 2: Runtime
FROM python:3.9.23-alpine3.22
EXPOSE 8080
RUN groupadd -S roboshop && useradd -S roboshop -G roboshop
WORKDIR /opt/server
COPY --from=builder /opt/server /opt/server/
RUN pip3 install -r requirements.txt
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