
# Stage 1: Build stage
FROM maven:3.8.3-openjdk-11 AS build

WORKDIR /app

COPY pom.xml .
COPY src src
# Copy the .git directory into the image as required by the application
COPY .git /app/.git
RUN mvn clean package

# Stage 2: Final stage
FROM openjdk:11-jre-slim

WORKDIR /app

COPY --from=build /app/target/devops-automation.jar /app/

EXPOSE 8080

CMD ["java", "-jar", "devops-automation.jar"]

