# docker-compose-kylemanna-openvpn
Simple script based Docker-Compose usage of kylemanna/openvpn Docker image.
Up and running in less than two minutes!

## Get Started!

Prerequisites: [Install Docker](https://docs.docker.com/engine/installation/) and [Docker-Compose](https://docs.docker.com/compose/install/)

1. Clone the Repo
```
git clone https://github.com/tammon/docker-compose-kylemanna-openvpn.git
cd docker-compose-kylemanna-openvpn
```
2. Change the `.env` environment-file to your needs
```
# Environment File for OpenVPN Server

# Hostname on which your server is reachable
HOSTNAME=myserver.com

# Protocol to use by OpenVPN: TCP/UDP
PROTO=udp

# The port which should be exposed on the docker host
PUBLIC_PORT=1194
```
3. Install the OpenVPN Server
```
./00_install-OpenVPN-Server.sh
```
4. Start the OpenVPN Server
```
docker-compose up -d
```

## Create new OpenVPN Client
The creation of new clients and configuration is also script based.
```
# Create client without private key passphrase
./create-new-client-and-get-conf.sh myClient nopass

# Create client with private key passphrase
./create-new-client-and-get-conf.sh myClient
```
The client will get registered in the server and a myClient.ovpn configuration file will be saved to `client-confs/myClient.ovpn`

To get the client configuration file of a previously created client:
```
./get-client-conf.sh myClient
```

## Revoke Client
You may want to revoke clients from accessing your server.
```
./revoke-client-conf.sh myClient
```
This will revoke the client's certificate and remove all files and configuration from your server

## Script Logs
All script activities of created or revoked clients get logged in `./VPNclients.log`

## Configuration Volumes
This Docker-Compose file uses Docker's volumes stored in `/var/lib/docker/volumes/YOURSERVICENAME_ovpndata`. You'll find all OpenVPN related configurations in this directory. 
If you want to store your configurations in a more accessible place like your service folder, consider changing the volumes mapping in `docker-compose.yml` to e.g. `./ovpn-data:/etc/openvpn`. 
Don't forget that this folder will be owned by `root` so you might want to `sudo chown -R MYUSER: ./ovpn-data`
