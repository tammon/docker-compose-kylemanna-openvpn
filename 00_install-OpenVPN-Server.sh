#!/bin/bash
# Check if .env file exists
if [ -e .env ]; then
    source .env
else 
    echo "Please set up your .env file before starting your enviornment."
    exit 1
fi

docker-compose run --rm server ovpn_genconfig -u $PROTO://$HOSTNAME
docker-compose run --rm server ovpn_initpki
