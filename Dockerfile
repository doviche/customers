FROM openjdk:17-oracle
LABEL Douglas Oviche <doviche@gmail.com>

WORKDIR /app

ENV APP_NAME=customers-1.1

ARG USER_HOME_DIR="/root"

USER 10014

EXPOSE 8080

CMD java -jar ${APP_NAME}.jar
