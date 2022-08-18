FROM openjdk:8-jdk-alpine
ARG JAR_FILE=/var/jenkins_home/workspace/my-pipeline/target/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]