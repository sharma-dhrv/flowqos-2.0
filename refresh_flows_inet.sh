#!/bin/bash

FLOWS_IN="flows_ovs_in_inet.txt"
FLOWS_OUT="flows_ovs_out_inet.txt"

ovs-ofctl del-flows ovs-out
ovs-ofctl del-flows ovs-in

ovs-ofctl add-flows ovs-in $FLOWS_IN
ovs-ofctl add-flows ovs-out $FLOWS_OUT
