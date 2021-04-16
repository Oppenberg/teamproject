#!/bin/sh

sudo apt-get update
sudo apt install numactl -y

chmod +x /local/repository/benchmarks/runme_xeon64
chmod +x /local/repository/benchmarks/lininput_xeon64
chmod +x /local/repository/benchmarks/xlinpack_xeon64

mv /local/repository/* /users/Am943807/linpack
