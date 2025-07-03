# Stage 1: Build the application
FROM maven:3.8.5-openjdk-8-slim AS builder

# Set the working directory inside the container to /app
WORKDIR /app

# Copy the entire 'webapp' directory from the build context (cloned repo)
# into the /app directory inside the container.
# This will create /app/webapp, containing pom.xml and src for your webapp.
COPY webapp ./webapp

# Change the working directory inside the container to the 'webapp' subfolder.
# All subsequent commands in this stage will be executed from /app/webapp.
WORKDIR /app/webapp

# Build the Maven project. Now that the working directory is /app/webapp,
# mvn will find the correct pom.xml and src directory.
RUN mvn clean package -DskipTests

# Stage 2: Create the final image
FROM tomcat:8-jre8

# Maintainer information (optional)
MAINTAINER "info@webmagicinformatica.com"

# Copy the WAR file from the builder stage to Tomcat's webapps directory.
# The WAR file will be located at /app/webapp/target/webapp.war in the 'builder' stage.
COPY --from=builder /app/webapp/target/webapp.war /usr/local/tomcat/webapps/

# Expose port 8080 (default for Tomcat applications)
EXPOSE 8080

# Command to run Tomcat (default for tomcat image)
CMD ["catalina.sh", "run"]
