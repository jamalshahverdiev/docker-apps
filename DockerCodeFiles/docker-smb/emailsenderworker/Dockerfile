FROM java:8
WORKDIR /app/backend
COPY ["email-sender-worker/target/classes/email-sender-worker-1.0.jar", "execJavaApp.sh", "/app/backend/"]
#EXPOSE 8080
ENTRYPOINT ["/app/backend/execJavaApp.sh"]
