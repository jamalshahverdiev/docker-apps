### This example shows us to create docker image for the Spring Boot Java application

##### Create docker image with the TAG *javaapp*:
```bash
# docker build -t javaapp .
```

##### Run new container with the name *javaApp* from docker image which tagged with the name *javaapp* and *prod* argument to the container which is going to be run:
```bash
# docker container run -d --name javaApp -t -v javanackend:/var/log/javaapplogs/ -p 8080:8080 javaapp prod
```

##### To look at the log file use the following command in the host Linux for he docker containers:
```bash
# tail -f /var/lib/docker/volumes/javanackend/_data/backend.log
```

##### If you want go to inside of this container use the following command:
```bash
# docker exec -it javaApp bash
```

##### At the end you can get the URL address with the following command:
```bash
# echo "http://$(ifconfig `nmcli device status | grep System | tail -n1 | awk '{ print $1 }'` | grep 'inet ' | awk '{ print $2 }'):8080/"
```

##### If you want to stop and delete container use the following command:
```bash
# docker container stop javaApp && docker container rm javaApp
```
