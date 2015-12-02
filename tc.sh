#!/bin/bash
tc qdisc add dev veth1 root handle 1: htb default 6

tc class add dev veth1 parent 1: classid 1:1 htb rate 100kbps ceil 100kbps prio 100
tc class add dev veth1 parent 1:1 classid 1:4 htb rate 30kbps ceil 100kbps prio 100 
tc class add dev veth1 parent 1:1 classid 1:5 htb rate 10kbps ceil 100kbps prio 100
tc class add dev veth1 parent 1:1 classid 1:6 htb rate 60kbps ceil 80kbps prio 100 


#This is filtering the iperf, because of the ports.
iptables -t mangle -A OUTPUT -o veth1 -p tcp --dport 5001 -s 10.0.0.102 -j MARK --set-mark 0x6
#iptables -t mangle -A OUTPUT -o veth1 -p tcp --dport 5001 -d 10.0.0.101 -j MARK --set-mark 0x6

#This is filtering the video, because of the ports. 
#TODO: ADD CORRECT SOURCES AND IP-Addresses.
iptables -t mangle -A OUTPUT -o veth1 -p tcp --sport 80 -s 10.0.0.102 -j MARK --set-mark 0x4
#iptables -t mangle -A OUTPUT -o veth1 -p udp --dport 5004 -d 10.0.0.101 -j MARK --set-mark 4


#This is filtering the Filetransfer, because of tcp.
iptables -t mangle -A OUTPUT -o veth1 -p tcp --sport 22 -s 10.0.0.102 -j MARK --set-mark 0x7
#iptables -t mangle -A OUTPUT -o veth1 -p tcp  -d 10.0.0.101 -j MARK --set-mark 0x7

#This is filtering the skype/VOIP, because of udp.
#iptables -t mangle -A OUTPUT -o veth1 -p udp  -d 10.0.0.101 -j MARK --set-mark 0x5



#Adding filter for iperf: High (low in tc) priority
tc filter add dev veth1 protocol ip prio 0 handle 6 fw flowid 1:6

#Adding filter for FileTransfer: medium priority
tc filter add dev veth1 protocol ip prio 5 handle 7 fw flowid 1:6

#Adding filter for VOIP with low priority
tc filter add dev veth1 protocol ip prio 10 handle 5 fw flowid 1:5

#Adding filter for Video:2nd  Highest (low in tc) priority
tc filter add dev veth1 protocol ip prio 3 handle 4 fw flowid 1:4


