# Use the official Nginx image as a base
FROM nginx

# Copy the Nginx configuration file to the container
COPY nginx.conf /etc/nginx/nginx.conf 
COPY sites-enabled /etc/nginx/sites-enabled
RUN mkdir /etc/certs
COPY ssl  /etc/certs/.
# Expose the ports that Nginx will use for HTTP and HTTPS traffic
EXPOSE 80 443

# Set the command to run when the container starts
#CMD ["nginx", "-g", "daemon off;"]
