# Docker multi-stage build

# 1. Building the App with Maven
FROM maven:3.8.7-eclipse-temurin-19-alpine

# 2. Just using the build artifact and then removing the build-container
FROM openjdk:17-oracle

ADD . /customers
RUN cd /customers

# Just echo so we can see, if everything is there :)
RUN ls -la /home

# Run Maven build
RUN mvn clean install

# Create a new user with UID 10014
RUN addgroup -g 10014 choreo && \
    adduser  --disabled-password  --no-create-home --uid 10014 --ingroup choreo choreouser

USER 10014

# Add Spring Boot app.jar to Container
COPY --from=0 "/customers/target/customers-1.1.jar" app.jar

# Fire up our Spring Boot app by default
CMD [ "sh", "-c", "java -jar customers-1.1.jar" ]
