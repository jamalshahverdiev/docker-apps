### This example shows us to create docker images for Sonarqube with SonarScanner and healthcheck

##### In the first console execute the following command:
```bash
# docker-compose up --build
```

##### In the second console execute the following command and analyze output wuth the status **UP**:
```bash
# watch -n0.1 curl -s -f -u admin:admin http://localhost:9000/api/system/status
```
