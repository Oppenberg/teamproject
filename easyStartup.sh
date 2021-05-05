#!/bin/sh
apt-get update
apt-get install -y mysql-server
apt install -y sysbench

service mysql start
service mysql status
#mysql -uroot -psupervisor
#use mysql
#UPDATE mysql.user SET authentication_string = PASSWORD('supervisor') WHERE User = 'root' AND Host = 'localhost';
#ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'SUPERVISOR';
#GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY 'supervisor';
#flush privileges;
#quit;
#sudo service mysql restart
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
sleep 5

        sysbench /usr/share/sysbench/oltp_read_write.lua       \
                --mysql-db=mysql --mysql-host=localhost        \
                --mysql-user=root --mysql-password=supervisor  \
                --mysql-port=3306 --debug=on --db-driver=mysql \
                --events=1000 --time=60 --threads=4 cleanup
