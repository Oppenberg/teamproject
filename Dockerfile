#getting base image
FROM ubuntu

MAINTAINER Alyssa (Lyssa) S

RUN apt-get update
RUN apt-get install -y mysql-server
RUN apt install -y sysbench

COPY easyStartup.sh /easyStartup.sh

CMD ["/easyStartup.sh"]

------------------------------------------------------------------------------------
#old version

#getting base image
FROM ubuntu

MAINTAINER Alyssa (Lyssa) S

RUN apt-get update
RUN apt-get install mysql-server
RUN apt install sysbench

CMD sysbench /usr/share/sysbench/oltp_read_write.lua --mysql-db=mysql --mysql-host=localhost --mysql-user=root --mysql-password=supervisor --mysql-port=3306 --debug=on --db-driver=mysql prepare
CMD sysbench /usr/share/sysbench/oltp_read_write.lua --mysql-db=mysql --mysql-host=localhost --mysql-user=root --mysql-password=supervisor --mysql-port=3306 --debug=on --db-driver=mysql run
