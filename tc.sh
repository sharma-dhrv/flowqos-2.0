#!/bin/bash


IFACE="veth1"

VIDEO_CLASSIFIER="-p tcp --sport 80 -s 10.0.0.102 -j MARK --set-mark 0x4"
#VOIP_CLASSIFIER="-p tcp --dport 5001 -s 10.0.0.102 -j MARK --set-mark 0x5"
GAME_CLASSIFIER="-p tcp --dport 5001 -s 10.0.0.102 -j MARK --set-mark 0x6"
#WEB_CLASSIFIER="-p tcp --sport 22 -s 10.0.0.102 -j MARK --set-mark 0x7"

MAX_RATE="10mbit"
VIDEO_RATE="5mbit"
#VOIP_RATE="10mbit"
GAME_RATE="5mbit"
#WEB_RATE="0mbit"


VIDEO_PRIORITY="prio 10 handle 4 fw flowid 1:4"
#VOIP_PRIORITY="prio 0 handle 5 fw flowid 1:5"
GAME_PRIORITY="prio 30 handle 6 fw flowid 1:6"
#WEB_PRIORITY="prio 20 handle 7 fw flowid 1:7"


if [ ! $EUID -eq 0 ]; then
    echo "Need to be root. Try, sudo $0 $@"
    exit 1
fi

if [ $# -lt 1 ]; then
    echo "Usage: $0 [create | delete]"
    exit 1
fi

create_qdisc()
{

    tc qdisc add dev $IFACE root handle 1: htb default 6

    tc class add dev $IFACE parent 1: classid 1:1 htb rate $MAX_RATE ceil $MAX_RATE prio 100
    tc class add dev $IFACE parent 1:1 classid 1:4 htb rate $VIDEO_RATE ceil $MAX_RATE prio 100 
    #tc class add dev $IFACE parent 1:1 classid 1:5 htb rate $VOIP_RATE ceil $MAX_RATE prio 100
    tc class add dev $IFACE parent 1:1 classid 1:6 htb rate $GAME_RATE ceil $MAX_RATE prio 100 
    #tc class add dev $IFACE parent 1:1 classid 1:7 htb rate $WEB_RATE ceil $MAX_RATE prio 100 
}

delete_qdisc()
{
    tc qdisc del dev $IFACE root
}

create_iptables()
{

    iptables -t mangle -D OUTPUT -o $IFACE $VIDEO_CLASSIFIER
    #iptables -t mangle -D OUTPUT -o $IFACE $VOIP_CLASSIFIER
    iptables -t mangle -D OUTPUT -o $IFACE $VIDEO_CLASSIFIER
    #iptables -t mangle -D OUTPUT -o $IFACE $WEB_CLASSIFIER
    
    #This is filtering the iperf, because of the ports.
    #iptables -t mangle -A OUTPUT -o $IFACE -p tcp --dport 5001 -s 10.0.0.102 -j MARK --set-mark 0x6
    #iptables -t mangle -A OUTPUT -o veth1 -p tcp --dport 5001 -d 10.0.0.101 -j MARK --set-mark 0x6

    #This is filtering the video, because of the ports. 
    #TODO: ADD CORRECT SOURCES AND IP-Addresses.
    #iptables -t mangle -A OUTPUT -o $IFACE -p tcp --sport 80 -s 10.0.0.102 -j MARK --set-mark 0x4
    #iptables -t mangle -A OUTPUT -o veth1 -p udp --dport 5004 -d 10.0.0.101 -j MARK --set-mark 4


    #This is filtering the Filetransfer, because of tcp.
    #iptables -t mangle -A OUTPUT -o $IFACE -p tcp --sport 22 -s 10.0.0.102 -j MARK --set-mark 0x7
    #iptables -t mangle -A OUTPUT -o veth1 -p tcp  -d 10.0.0.101 -j MARK --set-mark 0x7

    #This is filtering the skype/VOIP, because of udp.
    #iptables -t mangle -A OUTPUT -o veth1 -p udp  -d 10.0.0.101 -j MARK --set-mark 0x5
}


delete_iptables()
{
    iptables -t mangle -D OUTPUT -o $IFACE $VIDEO_CLASSIFIER
    #iptables -t mangle -D OUTPUT -o $IFACE $VOIP_CLASSIFIER
    iptables -t mangle -D OUTPUT -o $IFACE $VIDEO_CLASSIFIER
    #iptables -t mangle -D OUTPUT -o $IFACE $WEB_CLASSIFIER
}



create_prio()
{
    tc filter add dev $IFACE protocol ip $VIDEO_PRIORITY
    #tc filter add dev $IFACE protocol ip $VOIP_PRIORITY
    tc filter add dev $IFACE protocol ip $GAME_PRIORITY
    #tc filter add dev $IFACE protocol ip $WEB_PRIORITY
    
    #Adding filter for iperf: High (low in tc) priority
    #tc filter add dev $IFACE protocol ip prio 0 handle 6 fw flowid 1:6

    #Adding filter for FileTransfer: medium priority
    #tc filter add dev $IFACE protocol ip prio 5 handle 7 fw flowid 1:6

    #Adding filter for VOIP with low priority
    #tc filter add dev $IFACE protocol ip prio 10 handle 5 fw flowid 1:5

    #Adding filter for Video:2nd  Highest (low in tc) priority
    #tc filter add dev $IFACE protocol ip prio 3 handle 4 fw flowid 1:4
}

create()
{
    create_qdisc
    create_iptables
    create_prio
}

delete()
{
    delete_iptables
    delete_qdisc
}


case $1 in
    "create")   create
                ;;

    "delete")   delete
                ;;

    *)          echo "Usage: $0 [create | delete]"
                ;;
esac

exit 0

