FROM tomcat:10.0.2
COPY /HW_2.war /usr/local/tomcat/webapps
EXPOSE 80
CMD ["catalina.sh", "run"]

