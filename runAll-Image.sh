#!/bin/bash

docker pull mintyblot/linpack-1:latest
ocker run -ti --privileged mintyblot/linpack-1:latest
docker image rm -f mintyblot/linpack-1:latest

docker pull mintyblot/linpack-2:latest
ocker run -ti --privileged mintyblot/linpack-2:latest
docker image rm -f mintyblot/linpack-2:latest

cd benchmarks
time numactl --physcpubind=0-7,16-23 --localalloc ./runme_xeon64
time numactl --physcpubind=0-31 --interleave=0,1 ./runme_xeon64
