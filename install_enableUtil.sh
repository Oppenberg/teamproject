#!/bin/sh

sudo apt-get update
sudo apt install numactl -y

make all 
mv /local/repository/* /users/Am943807/stream
