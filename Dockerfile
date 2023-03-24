FROM openjdk:17-oracle
LABEL Douglas Oviche <doviche@gmail.com>

WORKDIR /app
ENV APP_NAME=customers-1.1

USER 10014

COPY ${APP_NAME}.jar /app/${APP_NAME}.jar

EXPOSE 8080

CMD java -jar /app/${APP_NAME}.jar
