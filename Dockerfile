FROM eclipse-temurin:17-jre
WORKDIR /app

# Copy the built jar from the backend build stage
COPY target/*.jar app.jar

# Expose the port and define the entry point
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
