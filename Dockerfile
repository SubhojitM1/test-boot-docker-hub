# Start with a base image containing Java runtime
FROM openjdk:8-jdk-alpine

# Add Maintainer Info
LABEL maintainer="subhojit.misra@gmail.com"

# Add a volume pointing to /tmp
VOLUME D:/Temp

# Make port 8080 available to the world outside this container
EXPOSE 8080

# The application's jar file
ARG JAR_FILE=target/test-boot-docker-hub-0.0.1-SNAPSHOT.jar

# Add the application's jar to the container
ADD ${JAR_FILE} test-boot-docker-hub.jar

# Run the jar file 
ENTRYPOINT ["java","-jar","/test-boot-docker-hub.jar"]