#!/bin/bash

sudo docker pull mintyblot/randomaccess1:latest
for ((i=0;i<10;i++)); do sudo docker run -ti --privileged mintyblot/randomaccess1:latest; done
sudo docker image rm -f mintyblot/randomaccess1:latest

sudo docker pull mintyblot/randomaccess2:latest
for ((i=0;i<10;i++)); do sudo docker run -ti --privileged mintyblot/randomaccess2:latest; done
sudo docker image rm -f mintyblot/randomaccess2:latest

cd bin
for ((i=0;i<10;i++)); do time numactl --physcpubind=0-7,16-23 --localalloc ./gups.exe; done
for ((i=0;i<10;i++)); do time numactl --physcpubind=0-31 --interleave=0,1 ./gups.exe; done
