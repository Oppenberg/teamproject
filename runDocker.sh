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

docker build -t RandomAccess .


now=`date`
echo "Running Random Access, started at $now"
echo "--------------------------------------------------------------------------------"
echo "Running Random access, started at $now"
docker run -ti --privileged RandomAccess
docker image rm -f RandomAccess
rm -f Dockerfile
echo ""
echo -n "Experiment completed at "; date
