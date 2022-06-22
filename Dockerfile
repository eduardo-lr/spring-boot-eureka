FROM maven:3.6.0-jdk-11-slim AS build
COPY src /home/app/src
COPY pom.xml /home/app
WORKDIR /home/app
RUN mvn install

FROM openjdk:8-jdk-alpine
WORKDIR /home/app
COPY --from=build target/springboot-servicio-eureka-server-0.0.1-SNAPSHOT.jar eureka-app.jar
EXPOSE 8761
CMD ["java", "-jar", "eureka-app.jar"]
