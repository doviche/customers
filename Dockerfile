FROM openjdk:17-oracle

ENV APP_NAME=customers-1.1

# Run Maven build
RUN mvn clean install

COPY ~${APP_NAME}.jar /usr/${APP_NAME}/


# Create a new user with UID 10014
RUN addgroup -g 10014 choreo && \
    adduser  --disabled-password  --no-create-home --uid 10014 --ingroup choreo choreouser

USER 10014

EXPOSE 8080

WORKDIR /usr/customers/


CMD java -jar ${APP_NAME}.jar
