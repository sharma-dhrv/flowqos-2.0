#!/bin/bash
tc qdisc add dev eth0 root handle 1: htb default 6

tc class add dev eth0 parent 1: classid 1:1 htb rate 100kbps ceil 100kbps prio 100
tc class add dev eth0 parent 1:1 classid 1:4 htb rate 30kbps ceil 100kbps prio 100 
tc class add dev eth0 parent 1:1 classid 1:5 htb rate 10kbps ceil 100kbps prio 100
tc class add dev eth0 parent 1:1 classid 1:6 htb rate 60kbps ceil 100kbps prio 100 

tc filter add dev eth0 protocol ip prio 0 u32 match ip dport 5001 0xffff match ip dst 10.0.0.101 flowid 1:6

tc filter add dev eth0 protocol ip prio 0 u32 match ip dport 5001 0xffff match ip dst 10.0.0.101 flowid 1:6

tc filter add dev eth0 protocol ip prio 5 u32 match ip dst 10.0.0.101 flowid 1:4

tc filter add dev eth0 protocol ip prio 5 u32 match ip dst 10.0.0.101 flowid 1:4






