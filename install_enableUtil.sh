#!/bin/sh

echo "Enter user dir to build to:"
read varname

sudo apt-get update
sudo apt install numactl -y

chmod +x /local/repository/runLocal.sh
chmod +x /local/repository/runDocker.sh
chmod +x /local/repository/runAll.sh
chmod +x /local/repository/runAll-Image.sh
make $all

mkdir -p /users/$varname/stream

mv /local/repository/* /users/$varname/stream


