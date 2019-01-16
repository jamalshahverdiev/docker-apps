### This example shows us to create docker image for the Python Flask application

##### Create docker image with the TAG *pythonapp*:
```bash
# docker build -t pythonapp .
```

##### Run new container with the name *pythonApp* from docker image which tagged with the name *pythonapp*:
```bash
# docker run --name pythonApp -p 9080:9080 -d -t pythonapp
```

##### If you want go to inside of this container use the following command:
```bash
# docker exec -it pythonApp /bin/sh
```

##### At the end you can get the URL address with the following command:
```bash
# echo "http://$(ifconfig `nmcli device status | grep System | tail -n1 | awk '{ print $1 }'` | grep 'inet ' | awk '{ print $2 }'):9080/"
```
