#!/bin/bash


OVS_TC="ovs-tc"
VETH="veth"
INTERNET_IFACE="eth1"


if [ ! $EUID -eq 0 ]; then
    echo "Need to be root. Try, sudo $0 $@"
    exit 1
fi

if [ $# -lt 1 ]; then
    echo "Usage: $0 [create | delete]"
    exit 1
fi


create_ovs()
{
    ovs-vsctl add-br $1
    if [ ! -z "$2" ]; then
        ovs-vsctl set-fail-mode $1 secure
        ovs-ofctl del-flows $1
        ovs-vsctl set-controller $1 tcp:$CONTROLLER
        echo "Setting dpid of $1 : $2"
        ovs-vsctl set Bridge $1 other-config:datapath-id=$2
        sleep 1
        #ovs-vsctl set-controller $1 tcp:$CONTROLLER
    fi

    sleep 1
}


delete_ovs()
{
    ovs-vsctl del-br $1
}

create_link()
{
    ip link add dev "${1}0" type veth peer name "${1}1"
    ip link set "${1}0" up
    ip link set "${1}1" up
}


delete_link()
{
    ip link del "${1}0"
}


create_port()
{
    if [ ! -z "$3" ]; then
        ovs-vsctl add-port $1 $2 -- set Interface $2 ofport_request=$3
    else
        ovs-vsctl add-port $1 $2
    fi

    sleep 1
}


delete_port()
{
    ovs-vsctl del-port $1 $2
}


create()
{
    create_ovs $OVS_TC
    create_port $OVS_TC $INTERNET_IFACE

    create_link $VETH
    create_port $OVS_TC "${VETH}1"

    ifdown $INTERNET_IFACE && ifup $INTERNET_IFACE
    ifdown $OVS_TC && ifup $OVS_TC
    ifdown "${VETH}1" && ifup "${VETH}1"
    ifdown "${VETH}0" && ifup "${VETH}0"
}

delete()
{
    delete_port $OVS_TC "${VETH}1"
    delete_link "${VETH}1"
    delete_port $OVS_TC $INTERNET_IFACE

    delete_ovs $OVS_TC

    ifdown $INTERNET_IFACE && ifup $INTERNET_IFACE
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

