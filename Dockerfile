
# Build stage
FROM maven:3.9.8-openjdk AS build
COPY . .
RUN mvn clean package -DskipTests
# Run stage
FROM openjdk:21.0.4-jdk-slim

COPY --from=build /target/*.jar app.jar

CMD ["java", "-jar", "app.jar"]