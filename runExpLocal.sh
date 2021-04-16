#!/bin/bash

#one socket with numactl
cd benchmarks
time numactl --physcpubind=0-7,16-23 --localalloc ./runme_xeon64
time numactl --physcpubind=0-31 --interleave=0,1 ./runme_xeon64
