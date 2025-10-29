FROM maven:3.8-openjdk-11 AS build
WORKDIR /app
COPY . .
RUN mvn clean package

FROM tomcat:9-jdk11
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=build /app/target/college_merit_analyser.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
