FROM emeraldsquad/sonar-scanner
WORKDIR /project
RUN apk update && apk upgrade && apk add --update git && rm -rf /var/cache/apk/*
RUN git clone https://github.com/ReactiveX/RxJava.git .
COPY sonar-project.properties ./sonar-project.properties
