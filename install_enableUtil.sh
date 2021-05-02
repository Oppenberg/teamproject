#!/bin/sh
sudo apt-get update
sudo apt install numactl -y

chmod +x /local/repository/runLocal.sh
chmod +x /local/repository/runDocker.sh
chmod +x /local/repository/runAll.sh
chmod +x /local/repository/runAllImage.sh

make $all
