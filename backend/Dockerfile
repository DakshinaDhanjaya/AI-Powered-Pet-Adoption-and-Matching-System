FROM openjdk:17-slim

WORKDIR /app

# The JAR should be built by CI or locally via `mvn clean package`
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app.jar"]
