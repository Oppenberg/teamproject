#!/bin/bash

sudo docker pull mintyblot/stream-1:latest
for ((i=0;i<10;i++)); do sudo docker run -ti --privileged mintyblot/stream-1:latest; done
sudo docker image rm -f mintyblot/stream-1:latest

sudo docker pull mintyblot/stream-2:latest
for ((i=0;i<10;i++)); do sudo docker run -ti --privileged mintyblot/stream-2:latest; done
sudo docker image rm -f mintyblot/stream-2:latest

cd bin
for ((i=0;i<10;i++)); do time numactl --physcpubind=0-7,16-23 --localalloc ./stream.exe; done
for ((i=0;i<10;i++)); do time numactl --physcpubind=0-31 --interleave=0,1 ./stream.exe; done
