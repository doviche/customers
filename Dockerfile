# Docker multi-stage build

# 1. Building the App with Maven
FROM maven:3.8.7-eclipse-temurin-19-alpine

RUN ls /home


ADD . /customers
WORKDIR /customers

# Just echo so we can see, if everything is there :)
RUN ls -l


