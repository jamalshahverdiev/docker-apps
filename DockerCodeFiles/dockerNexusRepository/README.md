#### Create Docker Blob repositories:
![DockerBlobRepositories](../images/dockerBlobStories.PNG)

#### Create Docker repositories:
![DockerGroupPrivate](../images/dockergroupprivate.PNG)

#### Integrate Nexus OSS with Active Directory:
![DCIntegration1](../images/DCIntegration1.PNG)
![DCIntegration2](../images/DCIntegration2.PNG)

#### Move domain users under Users folder:
![MoveDCUsers](../images/DCUsers.PNG)

#### Create new role and give access to all docker permissions:
![AccessToDockerPeermissions](../images/NewNexusRoleForDocker.PNG)

#### Look at the Domain Users in the Nexus:
![LdapUseraccess](../images/LdapUserAccess1.PNG)
![DomainUsersInNexus](../images/DCUsersInNexus.PNG)

#### Give permission to the user to use Docker regostry server:
![SelectUserGiveAccess](../images/SelectUserAndGiveAccessWithRole.PNG)


#### Add the following lines to the `/etc/docker/daemon.json` file:
```bash
$ cat <<EOF > /etc/docker/daemon.json
{
      "insecure-registries" : ["nexus.loc:8082","nexus.loc:8083"]
}
EOF
$ systemctl restart docker
```

#### Login to the Nexus registry server for PUSH and Pull images with Domain Contoller credentials:
```bash
$ docker login -u dc.username -p 'password' nexus.loc:8082
$ docker login -u dc.username -p 'password' nexus.loc:8083
```

#### Pull some image to test:
```bash
$ docker pull nexus.loc:8082/phpdockerio/php7-fpm
```

#### Build some image with Tag to push our local repo:
```bash
$ docker build -t nexus.loc:8083/inadjavaapp:1 .
```

#### Write new tag to the existing image and then push it to the remote Docker Registry server:
```bash
$ docker tag docker-smb_emailsenderworker nexus.loc:8083/smb_emailsenderworker:v1 
$ docker push nexus.loc:8083/smb_emailsenderworker:v1
```

#### Push new image to the local docker registry server:
```bash
$ docker push nexus.loc:8083/inadjavaapp:latest
```
