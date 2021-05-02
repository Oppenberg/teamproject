#Image de base.
FROM debian:latest
MAINTAINER Mathieu GAILLARD <mathieu.gaillard@insa-lyon.fr>

#Mise à jour et installation des packets utiles.
RUN apt-get update \
&&  apt-get install -y pxz \
                       time \
&&  apt-get clean

#Récupération du fichier enwik8.
COPY enwik8 /root/enwik8

#Récupération du script.
COPY run.sh /root/run.sh
RUN chmod +x /root/run.sh

#Changement de répertoire
WORKDIR /root

#Compression du fichier enwik8 avec au maximum 1 thread.
CMD ./run.sh

