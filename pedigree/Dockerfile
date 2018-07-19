FROM tomcat:8.0.53-jre8-alpine
WORKDIR /opt/tomcat/webapps/
COPY /target/PedigreeFarmJS.war /opt/tomcat/webapps/PedigreeFarmJS
# Add admin/admin user
ADD tomcat-users.xml /opt/tomcat/conf/
# ADD ./src/PedigreeFarmJS.war /usr/local/tomcat/webapps/PedigreeFarmJS.war
EXPOSE 8080
# RUN ["apt-get", "update"]
# RUN ["apt-get", "install", "-y", "nano"]
CMD ["catalina.sh", "run"]