#!/bin/sh

# Set up the dockerfile
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 numberOfSockets (specify as 1 or 2)"
    exit 1
fi

if [ "$1" -eq 1 ]; then
    sudo rm -f Dockerfile
    sudo ln -s Dockerfile.OneSocket Dockerfile
elif [ "$1" -eq 2 ]; then
    sudo rm -f Dockerfile
    sudo ln -s Dockerfile.TwoSocket Dockerfile
else
    echo "Usage: $0 numberOfSockets (specify as 1 or 2)"
    exit 1
fi

sudo docker build -t randomaccess .


now=`date`
echo "Running Random Access, started at $now"
echo "--------------------------------------------------------------------------------"
echo "Running Random access, started at $now"
sudo docker run -ti --privileged randomaccess
sudo docker image rm -f randomaccess
sudo rm -f Dockerfile
echo ""
echo -n "Experiment completed at "; date
