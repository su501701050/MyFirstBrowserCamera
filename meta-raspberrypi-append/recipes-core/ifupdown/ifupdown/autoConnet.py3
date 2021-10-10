#!/usr/bin/env python

import os,time
while True:
	if'192'not in os.popen('ifconfig | grep 192').read():
		print('\n**wifi not work**\n')
		os.system('ifconfig wlan0 up')
		time.sleep(1)
		os.system('ifdown wlan0')
		time.sleep(1)
		os.system('ifup wlan0')
		time.sleep(20)
		os.system('ifconfig wlan0 broadcast 192.168.1.254 netmask 255.255.255.0 up')
	time.sleep(30)

