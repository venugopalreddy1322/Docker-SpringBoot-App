
FROM node:14-alpine3.17
WORKDIR /app
COPY target/devops-automation.jar /app/
EXPOSE 8080
CMD ["java", "-jar", "devops-automation.jar"]
