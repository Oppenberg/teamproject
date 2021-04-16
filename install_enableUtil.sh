#!/bin/sh

mv /local/repository/* /users/Am943807/linpack

sudo apt-get update
sudo apt install numactl -y

chmod +x /benchmarks/runme_xeon64
chmod +x /benchmarks/lininput_xeon64
chmod +x/benchmarks/xlinpack_xeon64


