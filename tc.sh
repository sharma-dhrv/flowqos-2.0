#!/bin/bash
tc qdisc add dev eth0 root handle 1: htb default 12

tc class add dev eth0 parent 1: classid 1:1 htb rate 100kbps ceil 100kbps prio 1
tc class add dev eth0 parent 1:1 classid 1:2 htb rate 40kbps ceil 100kbps prio 1
tc class add dev eth0 parent 1:2 classid 1:10 htb rate 30kbps ceil 100kbps prio 1
tc class add dev eth0 parent 1:2 classid 1:11 htb rate 10kbps ceil 100kbps prio 1
tc class add dev eth0 parent 1:1 classid 1:12 htb rate 60kbps ceil 100kbps prio 1

tc filter add dev eth0 protocol ip parent 1:2 prio 0 u32 match ip dst 10.0.0.102 flowid 1:10

