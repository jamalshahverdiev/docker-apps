##### To generate stats from inside of the docker we can use this image (Clone the repository and execute following steps): 
```bash
$ git clone https://github.com/jamalshahverdiev/docker-apps.git . && cd generate-statsd-traffic
```

##### Clone source code files from an Author `https://github.com/aussiearef` of codes:
```bash
$ git clone https://github.com/aussiearef/ShoeHub.git . && rm -rf ShoeHub.DataGenerator && unzip Releases/Ubuntu.zip && cp ubuntu/* .
```

##### Build image with the name `statsarg`:
```bash
$ docker build -t statsarg .
```

##### Run docker container with the needed arguments which will be the IP address of the StatsD server and dynamic number to generate traffic:
```bash
$ docker run --rm -d --name grafanastatsd statsarg 10.10.10.10 483
```
