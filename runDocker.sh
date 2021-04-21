#!/bin/sh

# Set up the dockerfile
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 numberOfSockets (specify as 1 or 2)"
    exit 1
fi

if [ "$1" -eq 1 ]; then
    rm -f Dockerfile
    ln -s Dockerfile.OneSocket Dockerfile
elif [ "$1" -eq 2 ]; then
    rm -f Dockerfile
    ln -s Dockerfile.TwoSocket Dockerfile
else
    echo "Usage: $0 numberOfSockets (specify as 1 or 2)"
    exit 1
fi

docker build -t linpack .


now=`date`
echo "Running linpack, started at $now"
echo "--------------------------------------------------------------------------------"
echo "Running linpack, started at $now"
docker run -ti --privileged linpack
docker image rm -f linpack
rm -f Dockerfile
echo ""
echo -n "Experiment completed at "; date
