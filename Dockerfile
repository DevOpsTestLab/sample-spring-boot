FROM openjdk:8u212-alpine

LABEL name "sample-spring-boot" 
LABEL maintainer "Cognizant"
LABEL version=1.0

ARG JAR_FILE=build/libs/*.jar

COPY ${JAR_FILE} app.jar

ENTRYPOINT ["java","-jar","/app.jar"]
