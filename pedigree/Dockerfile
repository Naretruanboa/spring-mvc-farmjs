FROM tomcat:8.0.53-jre8-alpine
# WORKDIR /usr/local/tomcat/webapps/
ADD ./target/PedigreeFarmJS.war /usr/local/tomcat/webapps/
# Add admin/admin user
ADD tomcat-users.xml /usr/local/tomcat/conf/
# ADD ./src/PedigreeFarmJS.war /usr/local/tomcat/webapps/PedigreeFarmJS.war
EXPOSE 8080
CMD ["catalina.sh", "run"]