# Use the official Nginx image as a base
FROM nginx
RUN apt update && apt install -y openvpn vim 
# Copy the Nginx configuration file to the container
COPY nginx.conf /etc/nginx/nginx.conf 
COPY sites-enabled /etc/nginx/sites-enabled
RUN mkdir /etc/certs && mkdir /scripts &&  mkdir /etc/certs/ssl 
COPY start.sh /scripts/start.sh
RUN chmod a+x /scripts/start.sh
COPY ssl  /etc/certs/ssl

COPY  open-vpn/openvpn.ovpn /etc/openvpn/client/client.conf
# Expose the ports that Nginx will use for HTTP and HTTPS traffic
EXPOSE 80 443

CMD /scripts/start.sh
# Set the command to run when the container starts
#CMD ["nginx", "-g", "daemon off;"]
#apt update; apt -y install vim iputils-ping net-tools procps