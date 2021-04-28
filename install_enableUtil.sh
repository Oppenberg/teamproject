#!/bin/sh

echo "Enter user dir to build to:"
read varname

sudo apt-get update
sudo apt install numactl -y

chmod +x /local/repository/benchmarks/runme_xeon64
chmod +x /local/repository/benchmarks/lininput_xeon64
chmod +x /local/repository/benchmarks/xlinpack_xeon64
chmod +x /local/repository/runExpLocal.sh
chmod +x /local/repository/runDocker.sh
chmod +x /local/repository/runAll.sh
chmod +x /local/repository/runAll-Images.sh

mkdir -p /users/$varname/linpack

mv /local/repository/* /users/$varname/linpack
