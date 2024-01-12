#FROM mysql:8.0-debian
FROM mariadb:latest
# Copy the custom my.cnf file to the MySQL configuration directory
RUN apt update -y && apt install -y default-mysql-client
COPY 50-server.cnf  /etc/mysql/mariadb.conf.d/50-server.cnf