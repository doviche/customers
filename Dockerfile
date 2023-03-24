# Docker multi-stage build
FROM openjdk:17-oracle

ADD . /customers
WORKDIR /customers

# Run Maven build
RUN mvn clean install

# Create a new user with UID 10014
RUN addgroup -g 10014 choreo && \
    adduser  --disabled-password  --no-create-home --uid 10014 --ingroup choreo choreouser

USER 10014

