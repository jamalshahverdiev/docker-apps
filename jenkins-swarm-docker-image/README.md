# Jenkins swarm slave

A [Jenkins swarm](https://wiki.jenkins-ci.org/display/JENKINS/Swarm+Plugin) slave.

## Take docker gid from host machine and Update `Dockerfile` file to use that
## To use Docker in Docker, in the slave node execute variable `dockerGidFromHost` and replace needed GID for docker service in the `Dockerfile`
```bash
$ dockerGidFromHost=$(cat /etc/group | grep docker | awk -F':' '{ print $(NF-1)}')
$ sed -i "s/change_docker_gid_from_host/$dockerGidFromHost/g" jswarmslave/Dockerfile
```

## Go to inside of the `jswarmslave` folder to build new image with name `jsswarmimage`:
```bash
$ docker build -t jsswarmimage .
```

## Or just execute `starter.sh` script to prepare images and start them.

## Create new container. The following command will create new container with name `dockerslave1` which will use same name to join to the Jenkins server as slave node. Container used `jsswarmimage` image which we have created before. From `-master`, `-username`, `-password` fields we can understand it is Jenkins URL, username, API token for the Jenkins master server. `-executors` paralel job executor count.
```bash
$ docker container run -v /var/run/docker.sock:/var/run/docker.sock:ro --name=dockerslave1 -d jsswarmimage -master http://10.0.80.83:8080 -username sahverdiyevcr -password API_TOKEN_OF_ADMIN_ACCOUNT -mode normal -name dockerslave1 -disableClientsUniqueId -executors 4
```

#### I have prepared `docker-compose.yml` to start 2 swarm agent in docker container which we can be executed via `starter.sh` script. `Dockerfile` and `jenkins-slave.sh` moved to the `jswarmslave` folder. 

## `jenkinswarmslaves.service` system unit file which we must add to the `/etc/systemd/system/` folder and then execute `systemctl daemon-reload && systemctl enable jenkinswarmslaves --now` command. System unit file calls `/root/jenkins-swarm-slave-docker/starter.sh` script and for that reason we must create right folder `/root/jenkins-swarm-slave-docker` to put all source code files `/root/jenkins-swarm-slave-docker`. Otherwise we must change path in the `/etc/systemd/system/jenkinswarmslaves.service` file.  
