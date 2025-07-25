FROM openjdk:21-jdk-slim
COPY target/my-app*.jar /app/my-app*.jar
ENTRYPOINT ["java", "-jar", "/app/my-app.jar"]