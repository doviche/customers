# Docker multi-stage build

# 1. Building the App with Maven
FROM maven:3.8.7-eclipse-temurin-19-alpine

ARG MAVEN_VERSION=3.9.1
ARG USER_HOME_DIR="/root"

ADD . /customers
WORKDIR /customers

# Just echo so we can see, if everything is there :)
RUN ls -l

# Run Maven build
RUN mvn clean install


# 2. Just using the build artifact and then removing the build-container
FROM openjdk:17-oracle


# https://security.alpinelinux.org/vuln/CVE-2021-46848
RUN apt update && apk upgrade libtasn1-progs

# https://security.alpinelinux.org/vuln/CVE-2022-37434
RUN apt update && apk upgrade zlib

# Create a new user with UID 10014
RUN addgroup -g 10014 choreo && \
    adduser  --disabled-password  --no-create-home --uid 10014 --ingroup choreo choreouser


VOLUME /tmp

USER 10014

# Add Spring Boot app.jar to Container
COPY --from=0 "/customers/target/customers-1.1.jar" app.jar

# Fire up our Spring Boot app by default
CMD [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]
