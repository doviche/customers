FROM openjdk:17-oracle

ENV APP_NAME=customers-1.1

# Run Maven build
RUN mvn clean install

RUN ls /home/wso2

