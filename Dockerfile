#
# Build Stage
#
FROM maven:3.6.0-jdk-11-slim AS build
COPY src /home/app/src
COPY pom.xml /home/app
# Nunca pule os testes unitários em ambiente de produção
RUN mvn -DskipTests -f /home/app/pom.xml clean package

#
# Package Stage
#
FROM openjdk:17-jdk-oracle
COPY --from=build /home/app/target/springboot-0.0.1-SNAPSHOT.jar /usr/local/lib/springboot-0.0.1-SNAPSHOT.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/usr/local/lib/springboot-0.0.1-SNAPSHOT.jar"]