# Docker multi-stage build
# 1. Building the App with Maven
FROM maven:3.8.7-eclipse-temurin-19-alpine

FROM openjdk:17-oracle

# Refer to Maven build -> finalName
ARG JAR_FILE=target/customers-1.1.jar

# cd /opt/app
WORKDIR /opt/app

# cp target/customers-1.1.jar /opt/app/app.jar
COPY ${JAR_FILE} app.jar

# java -jar /opt/app/app.jar
ENTRYPOINT ["java","-jar","app.jar"]

