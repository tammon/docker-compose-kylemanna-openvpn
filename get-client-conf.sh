#!/bin/bash
mkdir -p client-confs
docker-compose run --rm server ovpn_getclient $1 > client-confs/$1.ovpn
