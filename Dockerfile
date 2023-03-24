# Docker multi-stage build
FROM openjdk:17-oracle

ADD . /customers
WORKDIR /customers


# Run Maven build
RUN mvn clean install

