#!/usr/bin/env bash
java -Dspring.profiles.active=$1 -Dlogging.config=/app/backend/logback.xml -jar /app/backend/spring-petclinic-2.1.0.BUILD-SNAPSHOT.jar
