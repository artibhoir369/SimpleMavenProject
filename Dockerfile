# Pull base images
From tomcat:8-jre8 

# Maintainer 
MAINTAINER "info@webmagicinformatica.com" 
COPY ./webapp/target/webapp.war /usr/local/tomcat/webapps
