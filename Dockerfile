FROM tomcat:9.0-jdk8

# Remove default webapps (optional but recommended)
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file to Tomcat webapps folder
COPY target/javaJenkinsWebDockerCiCdPipeLine.war /usr/local/tomcat/webapps/javaJenkinsWebDockerCiCdPipeLine.war

# Change Tomcat port
RUN sed -i 's/port="8080"/port="1010"/' /usr/local/tomcat/conf/server.xml

# Expose the new port
EXPOSE 1010

# Start Tomcat
CMD ["catalina.sh", "run"]
