#!/bin/bash

IP=$1 && IFS=. read a b c d <<<"$IP"

IPGW="$a.$b.$c.254"
IPNET="$a.$b.$c.0"
IPBRST="$a.$b.$c.255"
DNS1="114.114.114.114"
DNS2="8.8.8.8"

sudo nmcli con mod "Wired connection 1" \
  ipv4.addresses "${IP}/24" \
  ipv4.gateway "$IPGW" \
  ipv4.dns "${DNS1},${DNS2}" \
  ipv4.dns-search "" \
  ipv4.method "manual"

# sudo cat >> /etc/netplan/01-network-manager-all.yaml << EOF
# auto enp6s0
# iface enp6s0 inet static
#     address $IP
#     gateway $IPGW
#     netmask 255.255.255.0
#     network $IPNET
#     broadcast $IPBRST
# EOF

## Modify host mac
#sudo ifconfig enp6s0 xx:xx:xx:xx:xx:xx