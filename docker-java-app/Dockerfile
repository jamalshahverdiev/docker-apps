FROM java:8
WORKDIR /app/backend
COPY ["spring-petclinic-2.1.0.BUILD-SNAPSHOT.jar", "logback.xml", "execJavaApp.sh", "/app/backend/"]
EXPOSE 8080
ENTRYPOINT ["/app/backend/execJavaApp.sh"]
