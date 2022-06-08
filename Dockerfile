FROM openjdk:8-jdk-alpine
COPY "./target/springboot-servicio-eureka-server-0.0.1-SNAPSHOT.jar" "eureka-app.jar"
EXPOSE 8761:8761
ENTRYPOINT ["java", "-jar", "eureka-app.jar"]