FROM openjdk:17-oracle

ENV APP_NAME=customers-1.1

ENV APP_NAME=customers-1.1

RUN adduser  --disabled-password  --no-create-home --uid 10014 --ingroup choreo choreouser

COPY target/${APP_NAME}.jar ${APP_NAME}.jar

USER 10014

EXPOSE 8081

WORKDIR /usr/${APP_NAME}/

ENTRYPOINT ["java","-jar","/${APP_NAME}.jar"]
