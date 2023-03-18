1. list docker netowrk

docker network ls

NETWORK ID     NAME      DRIVER    SCOPE
06f1053b0921   bridge    bridge    local => It is the Docker default networking mode which will enable the connectivity to the other interfaces of the host machine as well as among containers.
d8bcda185676   host      host      local =>  In this mode container will share the host’s network stack and all interfaces from the host will be available to the container. The container’s host name will match the host name on the host system including same IP address
d7c76cc959ac   none      null      local   => This mode will not configure any IP for the container and doesn’t have any access to the external network as well as for other containers.

2. Detials about the network

docker inspect network <Id>

3. Create a network.

docker network create  --driver=bridge   --subnet=172.28.0.0/16   --ip-range=172.28.5.0/24  --gateway=172.28.5.254  br0

4. See nework info.

C:\Users\lathe>docker inspect network br0
[
    {
        "Name": "br0",
        "Id": "c5b35824e01cddc95a434cc5642ffa5ddf8f877ed4828064737199933fad2d2a",
        "Created": "2023-03-17T14:21:29.4002551Z",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": {},
            "Config": [
                {
                    "Subnet": "172.28.0.0/16",
                    "IPRange": "172.28.5.0/24",
                    "Gateway": "172.28.5.254"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Containers": {},
        "Options": {},
        "Labels": {}
    }
]

