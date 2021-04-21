#!/bin/bash

numsockets=2
./docker.sh $numsockets
numsockets=1
./docker.sh $numsockets

cd benchmarks
time numactl --physcpubind=0-7,16-23 --localalloc ./runme_xeon64
time numactl --physcpubind=0-31 --interleave=0,1 ./runme_xeon64
