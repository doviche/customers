FROM openjdk:17-oracle

ENV APP_NAME=customers-1.1

COPY ./${APP_NAME}.jar /usr/${APP_NAME}/

ENV APP_NAME=customers-1.1

RUN adduser  --disabled-password  --no-create-home --uid 10014 --ingroup choreo choreouser

USER 10014

EXPOSE 8081

WORKDIR /usr/${APP_NAME}/

CMD java -XX:+UnlockExperimentalVMOptions -XshowSettings:vm -Xmx2048m -Xms2048m -jar ${APP_NAME}.jar
