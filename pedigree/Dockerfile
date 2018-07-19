FROM tomcat:8.0.53-jre8-alpine
ADD /target/PedigreeFarmJS /usr/local/tomcat/webapps/PedigreeFarmJS
# ADD ./src/PedigreeFarmJS.war /usr/local/tomcat/webapps/PedigreeFarmJS.war
EXPOSE 8080
# RUN ["apt-get", "update"]
# RUN ["apt-get", "install", "-y", "nano"]
CMD ["catalina.sh", "run"]