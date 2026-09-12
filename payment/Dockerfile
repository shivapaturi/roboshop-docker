FROM python:3.9 AS builder
WORKDIR /opt/server
COPY requirements.txt .
COPY payment.ini .
COPY *.py .
RUN pip3 install -r requirements.txt

# Stage 2: Runtime
FROM python:3.9.23-alpine3.22
EXPOSE 8080
RUN addgroup -S roboshop && adduser -S roboshop -G roboshop
WORKDIR /opt/server
COPY --from=builder --chown=roboshop:roboshop /opt/server /opt/server
RUN apk add python3-dev build-base linux-headers pcre-dev
RUN pip3 install -r requirements.txt
USER roboshop
COPY --from=builder --chown=roboshop:roboshop /opt/server /opt/server
CMD ["uwsgi", "--ini", "payment.ini"]


# FROM python:3.9
# EXPOSE 8080
# WORKDIR /opt/server
# COPY payment.ini .
# COPY *.py .
# COPY requirements.txt .
# RUN pip3 install -r requirements.txt
# CMD ["uwsgi", "--ini", "payment.ini"]

