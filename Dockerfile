FROM openjdk:17-oracle
FROM centos:centos7

ENV APP_NAME=customers-1.1

COPY ./${APP_NAME}.jar /usr/${APP_NAME}/

RUN chgrp -R 0 /usr/${APP_NAME}/ && \
    chmod -R g=rwx /usr/${APP_NAME}/


RUN useradd --create-home --uid 10014 -u 10014 appuser

USER appuser

EXPOSE 8080

WORKDIR /APP

COPY /.app

RUN pip install --no-cache-dir -r requirements.txt

