### This example shows us to create docker image for the Spring Boot Java application

##### Create docker image with the TAG *javaapp*:
```bash
# docker build -t javaapp .
```

##### Run new container with the name *javaApp* from docker image which tagged with the name *javaapp*:
```bash
# docker container run -d -t -p 8080:8080 --name javaApp javaapp
```

##### If you want go to inside of this container use the following command:
```bash
# docker exec -it javaApp bash
```

##### At the end you can get the URL address with the following command:
```bash
# echo "http://$(ifconfig `nmcli device status | grep System | tail -n1 | awk '{ print $1 }'` | grep 'inet ' | awk '{ print $2 }'):8080/"
```
