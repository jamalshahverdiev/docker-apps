##### With this docker image flow we input something an take output to the `target` folder. Just create folder with name `target` and then build image. After that run container with mount point which will take argument from console which will generate data and write output to the `target` folder in the host machine.

```bash
$ mkdir target
$ docker build -t inoutimage .
$ docker run --rm -d -it --name devtest --mount type=bind,source="$(pwd)"/target,target=/root inoutimage 1
```

Output wil be like as the following:
```bash
$ ll target/ && echo Size is: $(du -sh target/outputfile-size-1Gb | awk '{ print $1 }')
total 1048576
-rw-r--r-- 1 root root 1073741824 Feb  8 16:36 outputfile-size-1Gb
Size is: 1.0G
```
