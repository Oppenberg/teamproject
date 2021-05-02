#!/bin/sh
sudo apt-get update
sudo apt install numactl -y

make $all
