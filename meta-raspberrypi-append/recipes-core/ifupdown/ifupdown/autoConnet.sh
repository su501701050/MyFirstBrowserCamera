#!/bin/sh
rfkill unblock wifi
sleep 1
echo nameserver 8.8.8.8 >> /etc/resolv.conf
echo nameserver 10.16.10.1 >> /etc/resolv.conf
echo nameserver 192.168.1.1 >> /etc/resolv.conf
ifup eth0
sleep 3
#wlan0-------------------
#nohup python3 /usr/sbin/autoConnet.py3 & 
#sleep 30
#-------------------
ifdown eth0
sleep 1
ifconfig eth0 down
sleep 1
ifconfig eth0 10.14.9.165 broadcast 10.14.9.254 netmask 255.255.255.0 up
sleep 3
ifconfig eth0 10.14.9.165 broadcast 10.14.9.254 netmask 255.255.255.0 up
sleep 3
#eth0-------------------
nohup python3 /www/pages/camera.py3 & 
sleep 10
ifconfig eth0 10.14.9.165 broadcast 10.14.9.254 netmask 255.255.255.0 up
sleep 3
: exit 0
