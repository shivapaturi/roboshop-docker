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


# FROM python:3.9
# EXPOSE 8080
# WORKDIR /opt/server
# COPY payment.ini .
# COPY *.py .
# COPY requirements.txt .
# RUN pip3 install -r requirements.txt
# CMD ["uwsgi", "--ini", "payment.ini"]

