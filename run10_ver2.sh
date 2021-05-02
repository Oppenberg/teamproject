#!/bin/bash

for ((i=1;i<11;i++));
do
        echo " "
        echo " "
        echo "*** sysbench test number [$i] `date`" #this will print a message after every test
        echo "---------------------------------------------------------"
        sysbench /usr/share/sysbench/oltp_read_write.lua       \
                --mysql-db=mysql --mysql-host=localhost        \
                --mysql-user=root --mysql-password=supervisor  \
                --mysql-port=3306 --debug=on --db-driver=mysql \
                --events=1000 --time=60 --threads=4 prepare;

        sysbench /usr/share/sysbench/oltp_read_write.lua       \
                --mysql-db=mysql --mysql-host=localhost        \
                --mysql-user=root --mysql-password=supervisor  \
                --mysql-port=3306 --debug=on --db-driver=mysql \
                --events=1000 --time=60 --threads=4 run;

        sysbench /usr/share/sysbench/oltp_read_write.lua       \
                --mysql-db=mysql --mysql-host=localhost        \
                --mysql-user=root --mysql-password=supervisor  \
                --mysql-port=3306 --debug=on --db-driver=mysql \
                --events=1000 --time=60 --threads=4 cleanup;   #cleanup database to avoid deadlock errors on rerun
sleep 3
done
