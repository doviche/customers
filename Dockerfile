FROM openjdk:17-oracle
FROM centos:centos7

ENV APP_NAME=customers-1.1

COPY ./${APP_NAME}.jar /usr/${APP_NAME}/

RUN chgrp -R 0 /usr/${APP_NAME}/ && \
    chmod -R g=rwx /usr/${APP_NAME}/


RUN useradd --create-home --uid 1001 -u 100001 appuser

WORKDIR /APP

COPY /.app

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8080

ENV NAME World

USER appuser

CMD["python", "app.py]
