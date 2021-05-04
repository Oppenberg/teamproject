#!/bin/sh

echo "Enter user dir to build to:"
read varname

sudo apt-get update
sudo apt install numactl -y

chmod +x /local/repository/runLocal.sh
chmod +x /local/repository/runDocker.sh
chmod +x /local/repository/runAll.sh
chmod +x /local/repository/runAllImage.sh
chmod +x /local/repository/demo.sh


mkdir -p /users/$varname/stream

cp /local/repository/* /users/$varname/stream
cd /users/$varname/stream
mkdir bin
make $all
