FROM openjdk:17-oracle
FROM centos:centos7

ENV APP_NAME=customers-1.1

RUN addgroup -g 10014 choreo && \
    adduser  --disabled-password  --no-create-home --uid 10014 --ingroup choreo choreouser


USER 10014

EXPOSE 8080

VOLUME /tmp

# Add Spring Boot app.jar to Container
COPY --from=0 "/customers-1.1/target/customers-1.1.jar" app.jar

# Fire up our Spring Boot app by default
CMD [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]

