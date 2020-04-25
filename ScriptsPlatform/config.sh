#!/bin/bash

function configure_DHCP {
	systemctl restart NetworkManager
	apt install dnsmasq
	cp dnsmasq.conf  /etc/
	systemctl restart dnsmasq
}

function network_redirect {
	# Enable IP forwarding
	sudo sysctl -w net.ipv4.ip_forward=1
	sudo sysctl -w net.ipv6.conf.all.forwarding=1

	# Disable ICMP redirects
	sudo sysctl -w net.ipv4.conf.all.send_redirects=0

	# Redirect traffic
	sudo iptables -t nat -A PREROUTING -i eth1 -p tcp -j REDIRECT --to-port 8080
	sudo iptables -t nat -A PREROUTING -i eth1 -p tcp -j REDIRECT --to-port 8080
	sudo ip6tables -t nat -A PREROUTING -i eth1 -p tcp -j REDIRECT --to-port 8080
	sudo ip6tables -t nat -A PREROUTING -i eth1 -p tcp -j REDIRECT --to-port 8080
}

if [ $# -ne 0 ];
then
	echo 'Usage: bash config.sh'
	exit 0
fi
configure_DHCP
network_redirect
