FROM tomcat:10.1-jdk17

# Copy WAR vào Tomcat
COPY build/libs/DoAnWeb.war /usr/local/tomcat/webapps/

# (Tùy chọn) Copy MySQL JDBC driver nếu cần
# COPY mysql-connector-j-8.4.0.jar /usr/local/tomcat/lib/

EXPOSE 8080
