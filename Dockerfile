# Stage 1: Build the application
FROM maven:3.8.1 AS build
WORKDIR /app
COPY . .
RUN mvn clean package

# Stage 2: Create the final image
FROM openjdk:11
WORKDIR /app
COPY --from=build /app/target/devops-automation.jar /app/
EXPOSE 8000
CMD ["java", "-jar", "devops-automation.jar"]
