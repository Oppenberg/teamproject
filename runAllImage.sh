#!/bin/bash

docker pull mintyblot/stream-1:latest
docker run -ti --privileged mintyblot/stream-1:latest
docker image rm -f mintyblot/stream-1:latest

docker pull mintyblot/stream-2:latest
docker run -ti --privileged mintyblot/stream-2:latest
docker image rm -f mintyblot/stream-2:latest

cd bin
time numactl --physcpubind=0-7,16-23 --localalloc ./stream.exe
time numactl --physcpubind=0-31 --interleave=0,1 ./stream.exe
