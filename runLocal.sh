#!/bin/bash

#running local
cd bin

time numactl --physcpubind=0-7,16-23 --localalloc ./gups.exe
echo "--------------------------------------------------------------------------------"
time numactl --physcpubind=0-31 --interleave=0,1 ./gups.exe
