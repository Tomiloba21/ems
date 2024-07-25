
# Build stage
FROM eclipse-temurin:17-jdk-alpine AS builder

WORKDIR /app
COPY . .
RUN ./mvnw package -X


# Run stage
FROM eclipse-temurin:17-jdk-alpine AS runner

WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar

CMD ["java", "-jar", "app.jar"]