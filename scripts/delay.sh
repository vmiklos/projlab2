#!/bin/bash

# clean existing down- and uplink qdiscs, hide errors
tc qdisc del dev eth0 root 2> /dev/null > /dev/null

DELAY=200

if [ "$1" == "stop" ]; then
	exit
elif [ "$1" == "start" -a -n "$2" ]; then
	DELAY=$2
fi

tc qdisc add dev eth0 root netem delay ${DELAY}ms
