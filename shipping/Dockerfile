# Stage 1: Builder
FROM maven:3.9-eclipse-temurin-17-alpine AS builder
WORKDIR /opt/server

# Cache dependencies in a separate layer
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copy source code and build final jar
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Runtime
FROM eclipse-temurin:17-jre-alpine
WORKDIR /opt/server

# Create non-root user and group
RUN addgroup -S roboshop && adduser -S roboshop -G roboshop

# Copy compiled artifact with correct ownership
COPY --from=builder --chown=roboshop:roboshop /opt/server/target/shipping-*.jar /opt/server/shipping.jar 

ENV CART_ENDPOINT="cart:8080" \
    DB_HOST="mysql"

EXPOSE 8080

USER roboshop

CMD ["java", "-jar", "shipping.jar"]

# FROM maven
# WORKDIR /opt/server
# COPY pom.xml .
# COPY src /opt/server/src
# RUN mvn clean package
# RUN mv /opt/server/target/shipping-1.0.jar /opt/server/shipping.jar
# ENV CART_ENDPOINT="cart:8080" \
#     DB_HOST="mysql"
# CMD ["java","-jar","shipping.jar"]
