FROM maven:3.9-eclipse-temurin-17

WORKDIR /app

COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .
COPY src src

RUN chmod +x mvnw && env -u MAVEN_CONFIG ./mvnw package -DskipTests

ARG JAR_FILE=target/*.jar

CMD java -jar target/*.jar