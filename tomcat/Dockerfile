FROM tomcat:9.0.70-jdk11-temurin

# Set JVM options for initial and maximum memory pool
ENV CATALINA_OPTS="-Xms1024m -Xmx2048m"

# Move webapps
RUN mv webapps webapps.bk
RUN mv webapps.dist/ webapps

# Copy configuration files
COPY conf/ /usr/local/tomcat/conf/
COPY lib/ /usr/local/tomcat/lib/
COPY webapps/*.war /usr/local/tomcat/webapps/
COPY webapps/manager/META-INF/context.xml /usr/local/tomcat/webapps/manager/META-INF/

# Install mysql-client
RUN apt-get update && apt-get install -y mysql-client

# Copy the wait-for-mysql script
# COPY wait-for-mysql.sh /usr/local/bin/wait-for-mysql.sh

# Make the script executable
# RUN chmod +x /usr/local/bin/wait-for-mysql.sh

# Expose Tomcat port
EXPOSE 8080
