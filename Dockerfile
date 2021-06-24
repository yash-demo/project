FROM adoptopenjdk/openjdk8:ubi
ADD build/libs/microservice1-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar","/app.jar"]
