##### To generate stats from inside of the docker we can use this image (Clone the repository and execute following steps):
```bash
$ git clone https://github.com/jamalshahverdiev/docker-apps.git . && rm -rf .git/ && cd generate-statsd-traffic
```

##### Clone source code files from an Author `https://github.com/aussiearef` of codes:
```bash
$ git clone https://github.com/aussiearef/ShoeHub.git /tmp/ShoeHub && unzip /tmp/ShoeHub/Releases/Ubuntu.zip && cp ubuntu/* . && rm -rf ubuntu/
```

##### Build image with the name `statsarg`:
```zsh
$ docker build -t statsarg .
```

##### Run docker container with the needed arguments which will be the IP address of the StatsD server and dynamic number to generate traffic:
```zsh
$ docker run --rm -d --name grafanastatsd statsarg 10.10.10.10 483
```

##### Look at the logs, they must be as the following:
```zsh
➜  docker logs grafanastatsd
This utility program will populate randomly generated data to your Graphite
The generated Graphite buckets will represent an imaginary shoe store called Shoe Hub

Enter the IP address of your StatsD server: Please enter the number of data points from 1 to (2,147,483,646): Sending metrics to server...
shoehub.sales.Boots:15
Sending metrics to server...
shoehub.sales.Loafers:18
Sending metrics to server...
shoehub.sales.HighHeels:16
Sending metrics to server...
shoehub.sales.HighHeels:16
```
