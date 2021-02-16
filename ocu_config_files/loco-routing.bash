#!/bin/bash

hostIp=$1
robotIp=$2
wifiInterface=$3
ethInterface=$4
network=$5

# setup host routing
route

sudo ip route add 192.168.210.43 via 192.168.150.43
sudo ip route add 192.168.210.44 via 192.168.150.43

sudo iptables -A FORWARD -o $wifiInterface -i $ethInterface -s $network/24 -m conntrack --ctstate NEW -j ACCEPT
sudo iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
sudo iptables -t nat -F POSTROUTING
sudo iptables -t nat -A POSTROUTING -o $wifiInterface -j MASQUERADE
