# Docker multi-stage build

# 1. Building the App with Maven
FROM maven:3.8.3-openjdk-17

ADD . /customers
WORKDIR /customers

# Create a new user with UID 10014
RUN addgroup -g 10014 choreo && \
    adduser  --disabled-password  --no-create-home --uid 10014 --ingroup choreo choreouser

USER 10014

EXPOSE 8080


# Add Spring Boot app.jar to Container
COPY --from=0  customers-1.1.jar app.jar

# Fire up our Spring Boot app by default
CMD [ "sh", "-c", "java /app.jar" ]
