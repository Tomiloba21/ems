
## Build stage
#FROM maven:3.9.8-openjdk AS build
#COPY . .
#RUN mvn clean package -DskipTests
## Run stage
#FROM openjdk:21.0.4-jdk-slim
#
#COPY --from=build /target/*.jar app.jar
#
#CMD ["java", "-jar", "app.jar"]

FROM maven:3.8.5-openjdk AS build

COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17.0.1-jdk-slim
COPY --from=build /target/ems-backend-0.0.1-SNAPSHOT.jar ems-backend.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "ems-backend.jar"]