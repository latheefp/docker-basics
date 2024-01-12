# Use a base image with Apache and essential tools
FROM debian:buster-slim

# Install build dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    apache2

# Download and build PHP with ZTS support
RUN mkdir -p /usr/src/php
WORKDIR /usr/src/php
RUN apt-get install -y git
RUN git clone https://github.com/php/php-src.git .
RUN ./buildconf --force
RUN ./configure --enable-maintainer-zts --with-apxs2=/usr/bin/apxs --with-config-file-path=/usr/local/etc/php
RUN make && make install

# Configure Apache to use the custom PHP
RUN echo "LoadModule php_module /usr/lib/apache2/modules/libphp.so" >> /etc/apache2/mods-available/php7.4.load
RUN echo "<FilesMatch \.php$>" >> /etc/apache2/conf-available/php7.4.conf
RUN echo "    SetHandler application/x-httpd-php" >> /etc/apache2/conf-available/php7.4.conf
RUN echo "</FilesMatch>" >> /etc/apache2/conf-available/php7.4.conf
RUN a2enconf php7.4

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Expose port 80 for Apache
EXPOSE 80

# Start Apache in the foreground
CMD ["apachectl", "-D", "FOREGROUND"]
