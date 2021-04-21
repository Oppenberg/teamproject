#!/bin/bash

numsockets=2
time ./runDocker.sh $numsockets
numsockets=1
time ./runDocker.sh $numsockets

cd bin
time numactl --physcpubind=0-7,16-23 --localalloc ./stream.exe
time numactl --physcpubind=0-31 --interleave=0,1 ./stream.exe
