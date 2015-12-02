#!/bin/bash

ovs-vsctl add-br ovs-tc
ovs-vsctl add-port ovs-tc eth0

ip link add dev "veth0" type veth peer name "veth1"
ovs-vsctl add-port ovs-tc veth1

ifdown eth0 && ifup eth0
ifdown ovs-tc && ifup ovs-tc
ip link set "veth1" up
ip link set "veth0" up

