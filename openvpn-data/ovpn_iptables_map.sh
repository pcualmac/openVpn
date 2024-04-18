#!/bin/bash

echo "phpmyadminapione 8081"
iptables -t nat -A PREROUTING -d 192.168.255.1 -p tcp --dport 8081 -j DNAT --to-dest 192.168.192.4:80
iptables -t filter -A INPUT -p tcp -d 192.168.255.1 --dport 8081 -j ACCEPT

echo "LARAVELAPI ONE 8080"
iptables -t nat -A PREROUTING -d 192.168.255.1 -p tcp --dport 8080 -j DNAT --to-dest 192.168.192.3:8080
iptables -t filter -A INPUT -p tcp -d 192.168.255.1 --dport 8080 -j ACCEPT

echo "phpmyadminapitwo 8083"
iptables -t nat -A PREROUTING -d 192.168.255.1 -p tcp --dport 8083 -j DNAT --to-dest 192.168.192.6:80
iptables -t filter -A INPUT -p tcp -d 192.168.255.1 --dport 8083 -j ACCEPT

echo "LARAVELAPI TWO 8085"
iptables -t nat -A PREROUTING -d 192.168.255.1 -p tcp --dport 8085 -j DNAT --to-dest 192.168.192.7:8080
iptables -t filter -A INPUT -p tcp -d 192.168.255.1 --dport 8085 -j ACCEPT