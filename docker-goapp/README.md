### This example shows us to create docker image which used first from as the image layer in the second one

##### Create docker image with the TAG *gowebapp*:
```bash
# docker build -t gowebapp .
```
##### Run new container with the name *goapp* from docker image which tagged with the name *gowebapp*:
```bash
# docker container run -d -t -p 8080:8080 --name goapp gowebapp
```

##### If you want go to inside of this container use the following command:
```bash
docker exec -it goapp /bin/sh
```

##### At the end you can get the URL address with the following command:
```bash
# echo "http://$(ifconfig `nmcli device status | grep System | tail -n1 | awk '{ print $1 }'` | grep 'inet ' | awk '{ print $2 }'):8080/view/test"
```
