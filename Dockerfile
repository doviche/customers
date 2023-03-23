FROM openjdk:17-oracle

ENV APP_NAME=customers-1.1

COPY ./${APP_NAME}.jar /usr/${APP_NAME}/

RUN chgrp -R 0 /usr/${APP_NAME}/ && \
    chmod -R g=rwx /usr/${APP_NAME}/


# Create a new user with UID 10014
RUN addgroup -g 10014 choreo && \
    adduser  --disabled-password  --no-create-home --uid 10014 --ingroup choreo choreouser

#MAINTAINER doviche

VOLUME /tmp

USER 10014

# Add Spring Boot app.jar to Container
COPY --from=0 "/target/customers-1.1.jar" app.jar

# Fire up our Spring Boot app by default
CMD [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]

