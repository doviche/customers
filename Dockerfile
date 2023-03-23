FROM openjdk:17-oracle
FROM centos:centos7

ENV APP_NAME=customers-1.1

COPY ./${APP_NAME}.jar /usr/${APP_NAME}/

RUN chgrp -R 0 /usr/${APP_NAME}/ && \
    chmod -R g=rwx /usr/${APP_NAME}/


RUN useradd --create-home --uid 1001 appuser

USER appuser

EXPOSE 8081

WORKDIR /usr/${APP_NAME}/






CMD java -XX:+UnlockExperimentalVMOptions -XshowSettings:vm -Xmx2048m -Xms2048m -jar ${APP_NAME}.jar --spring.profiles.active=${APP_PROFILE}
