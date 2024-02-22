# Stage 1: Build the application 
FROM maven:3.8.1 AS builder
WORKDIR /app

# Copy only POM file first to leverage Docker cache
COPY . .

# Download dependencies (if changed) and build the project
RUN mvn clean package

# Copy the .git directory into the image
COPY .git /app/.git
# Stage 2: Create the final image
FROM node:14-alpine
WORKDIR /app

# Copy only the necessary artifacts from the build stage
COPY --from=builder /app/target/devops-automation.jar /app/

EXPOSE 8000
CMD ["java", "-jar", "devops-automation.jar"]
