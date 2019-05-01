#!/bin/bash

docker run \
    --name dnsmasq \
    -d \
    -p 53:53/udp \
    -p 5380:8080 \
    -v ~/var/etc/dnsmasq.conf:/etc/dnsmasq.conf \
    -e "HTTP_USER=root" \
    -e "HTTP_PASS=123456" \
    --restart always \
    tsdk/dnsmasq-docker

docker=dnsmasq
ip=192.168.82.254
gw=192.168.82.2
sudo env "PATH=$PATH" pipework br0 $docker $ip/24@$gw
echo "docker exec -it $docker sh"
