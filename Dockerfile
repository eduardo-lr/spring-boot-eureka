FROM openjdk:11-jre-slim
RUN apt update
RUN apt install maven
COPY src /home/app/src
COPY pom.xml /home/app
WORKDIR /home/app
RUN mvn install
COPY target/springboot-servicio-eureka-server-0.0.1-SNAPSHOT.jar eureka-app.jar
EXPOSE 8761
CMD ["java", "-jar", "eureka-app.jar"]