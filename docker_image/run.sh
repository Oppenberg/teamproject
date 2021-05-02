#!/bin/bash

#Initialisation du ramdisk.
mkdir ramdisk
mount -t tmpfs -o size=128M tmpfs ramdisk

#Copie du fichier enwik8 dans le ramdisk.
cp enwik8 ramdisk/

#Exécution du test
for i in $( seq 1 $NUMBER ); 
do /usr/bin/time -f "%e,%U,%S" -a -o result.csv pxz -zkcef -T ${THREADS} ramdisk/enwik8 > /dev/null;
echo $i / ${NUMBER};
done
