#!/bin/sh

sudo apt-get update
sudo apt install numactl -y

make $all
chmod +x /local/repository/runLocal.sh
chmod +x /local/repository/runDocker.sh
mv /local/repository/* /users/Am943807/stream
