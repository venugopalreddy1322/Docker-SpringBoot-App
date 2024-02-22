
FROM openjdk:11
WORKDIR /app
COPY target/devops-automation.jar /app/
EXPOSE 8080
CMD ["java", "-jar", "devops-automation.jar"]
