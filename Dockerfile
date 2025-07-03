# Stage 1: Build the application
FROM maven:3.8.5-openjdk-8-slim AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy the pom.xml and source code
COPY pom.xml .
COPY src ./src

# Build the Maven project
# -DskipTests skips running tests for faster build in Docker (can be removed if tests are needed)
RUN mvn clean package -DskipTests

# Stage 2: Create the final image
FROM tomcat:8-jre8

# Maintainer information (optional)
MAINTAINER "info@webmagicinformatica.com"

# Copy the WAR file from the builder stage to Tomcat's webapps directory
# The 'builder' is the name of the first stage
COPY --from=builder /app/target/webapp.war /usr/local/tomcat/webapps/

# Expose port 8080 (default for Tomcat)
EXPOSE 8080

# Command to run Tomcat (default for tomcat image)
CMD ["catalina.sh", "run"]
