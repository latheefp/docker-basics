
echo checking Nginx
nginx -t
echo "Starting openvpn"
openvpn --config  /etc/openvpn/client/client.conf&
echo "Staring the Nginx deamon"
nginx -g "daemon off;"