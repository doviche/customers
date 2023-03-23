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


