#!/bin/bash


OVS_IN="ovs-in"
OVS_OUT="ovs-out"
DPID_IN="000066b16f7a7495"
DPID_OUT="0000baf8d9adad9f"

OVS_VIDEO="br-video"
OVS_VOIP="br-voip"
OVS_GAME="br-game"
OVS_WEB="br-web"

LINK_VIDEO_IN="video-in"
LINK_VIDEO_OUT="video-out"
LINK_VOIP_IN="voip-in"
LINK_VOIP_OUT="voip-out"
LINK_GAME_IN="game-in"
LINK_GAME_OUT="game-out"
LINK_WEB_IN="web-in"
LINK_WEB_OUT="web-out"

PORT_HOME="1"
PORT_INTERNET="1"

PORT_VIDEO="4"
PORT_VOIP="5"
PORT_GAME="6"
PORT_WEB="7"

LINK_HOME="veth"
INTERNET_IFACE="eth0"

CONTROLLER="127.0.0.1:6633"


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
    echo "creating OVS.."
    create_ovs $OVS_IN $DPID_IN
    create_ovs $OVS_OUT $DPID_OUT

    create_ovs $OVS_VIDEO
    create_ovs $OVS_VOIP
    create_ovs $OVS_GAME
    create_ovs $OVS_WEB

    
    echo "Adding inner links..."
    create_link $LINK_VIDEO_IN
    create_port $OVS_IN "${LINK_VIDEO_IN}0" $PORT_VIDEO
    create_port $OVS_VIDEO "${LINK_VIDEO_IN}1"
    
    create_link $LINK_VOIP_IN
    create_port $OVS_IN "${LINK_VOIP_IN}0" $PORT_VOIP
    create_port $OVS_VOIP "${LINK_VOIP_IN}1"

    create_link $LINK_GAME_IN
    create_port $OVS_IN "${LINK_GAME_IN}0" $PORT_GAME
    create_port $OVS_GAME "${LINK_GAME_IN}1"

    create_link $LINK_WEB_IN
    create_port $OVS_IN "${LINK_WEB_IN}0" $PORT_WEB
    create_port $OVS_WEB "${LINK_WEB_IN}1"



    echo "Adding outer links..."
    create_link $LINK_VIDEO_OUT
    create_port $OVS_OUT "${LINK_VIDEO_OUT}0" $PORT_VIDEO
    create_port $OVS_VIDEO "${LINK_VIDEO_OUT}1"
    
    create_link $LINK_VOIP_OUT
    create_port $OVS_OUT "${LINK_VOIP_OUT}0" $PORT_VOIP
    create_port $OVS_VOIP "${LINK_VOIP_OUT}1"

    create_link $LINK_GAME_OUT
    create_port $OVS_OUT "${LINK_GAME_OUT}0" $PORT_GAME
    create_port $OVS_GAME "${LINK_GAME_OUT}1"

    create_link $LINK_WEB_OUT
    create_port $OVS_OUT "${LINK_WEB_OUT}0" $PORT_WEB
    create_port $OVS_WEB "${LINK_WEB_OUT}1"



    echo "Adding home and internet interfaces..."
    create_link $LINK_HOME
    create_port $OVS_IN "${LINK_HOME}1" $PORT_HOME

    create_port $OVS_OUT $INTERNET_IFACE $PORT_INTERNET


    ifdown $INTERNET_IFACE && ifup $INTERNET_IFACE
    ifdown $OVS_OUT && ifup $OVS_OUT
    ifdown $OVS_VIDEO && ifup $OVS_VIDEO
    ifdown $OVS_VOIP && ifup $OVS_VOIP
    ifdown $OVS_GAME && ifup $OVS_GAME
    ifdown $OVS_WEB && ifup $OVS_WEB
    ifdown $OVS_IN && ifup $OVS_IN
    ifdown "${LINK_HOME}0" && ifup "${LINK_HOME}0"
}


delete()
{
    echo "deleting inner links..."
    delete_port $OVS_IN "${LINK_VIDEO_IN}0"
    delete_port $OVS_VIDEO "${LINK_VIDEO_IN}1"
    delete_link $LINK_VIDEO_IN
    
    delete_port $OVS_IN "${LINK_VOIP_IN}0"
    delete_port $OVS_VOIP "${LINK_VOIP_IN}1"
    delete_link $LINK_VOIP_IN

    delete_port $OVS_IN "${LINK_GAME_IN}0"
    delete_port $OVS_GAME "${LINK_GAME_IN}1"
    delete_link $LINK_GAME_IN

    delete_port $OVS_IN "${LINK_WEB_IN}0"
    delete_port $OVS_WEB "${LINK_WEB_IN}1"
    delete_link $LINK_WEB_IN


    echo "deleting outer links..."
    delete_port $OVS_OUT "${LINK_VIDEO_OUT}0"
    delete_port $OVS_VIDEO "${LINK_VIDEO_OUT}1"
    delete_link $LINK_VIDEO_OUT
    
    delete_port $OVS_OUT "${LINK_VOIP_OUT}0"
    delete_port $OVS_VOIP "${LINK_VOIP_OUT}1"
    delete_link $LINK_VOIP_OUT

    delete_port $OVS_OUT "${LINK_GAME_OUT}0"
    delete_port $OVS_GAME "${LINK_GAME_OUT}1"
    delete_link $LINK_GAME_OUT

    delete_port $OVS_OUT "${LINK_WEB_OUT}0"
    delete_port $OVS_WEB "${LINK_WEB_OUT}1"
    delete_link $LINK_WEB_OUT


    echo "deleting OVS..."
    delete_port $OVS_IN "${LINK_HOME}1"
    delete_link $LINK_HOME

    delete_port $OVS_OUT $INTERNET_IFACE


    delete_ovs $OVS_IN
    delete_ovs $OVS_OUT

    delete_ovs $OVS_VIDEO
    delete_ovs $OVS_VOIP
    delete_ovs $OVS_GAME
    delete_ovs $OVS_WEB



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
