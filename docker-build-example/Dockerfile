  # base image
FROM ubuntu:18.04  
#label for image, this can be seen in docker inspect image after build

LABEL maintainer="contact@devopscube.com"   

#updating packags inside the inside ubuntu image and installing ngix websever.

RUN  apt-get -y update && apt-get -y install nginx 

#copy files from local directory path to docker images.

COPY files/default /etc/nginx/sites-available/default
COPY files/index.html /usr/share/nginx/html/index.html

#exposing port 80 as nginx listen on portl 80 inside image

EXPOSE 80

#runginx as websever.
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]