# For a single stage Dockerfile:
FROM openjdk:17.0.1-jdk-slim
WORKDIR /app
COPY target/ems-backend-0.0.1-SNAPSHOT.jar ems-backend.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "ems-backend.jar"]

