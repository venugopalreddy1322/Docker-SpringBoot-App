FROM openjdk:11
WORKDIR /app
COPY target/devops-automation.jar /app/devops-automation.jar
EXPOSE 8000
CMD [ "java", "-jar", "devops-automation.jar" ]