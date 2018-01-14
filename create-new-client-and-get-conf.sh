#!/bin/bash
# $1: Clientname
# $2: nopass if needed
docker-compose run --rm server easyrsa build-client-full $1 $2
./get-client-conf.sh $1
echo $(date '+%Y %b %d %H:%M'): created $1 >> VPNclients.log
