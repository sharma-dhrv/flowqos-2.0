#!/bin/bash

rate_video="1000"
burst_video="100"
rate_game="1000"
burst_game="100"


ovs-vsctl set interface video-in1 ingress_policing_rate=$rate_video
ovs-vsctl set interface video-in1 ingress_policing_burst=$burst_video

ovs-vsctl set interface video-out1 ingress_policing_rate=$rate_video
ovs-vsctl set interface video-out1 ingress_policing_burst=$burst_video

ovs-vsctl set interface game-in1 ingress_policing_rate=$rate_game
ovs-vsctl set interface game-in1 ingress_policing_burst=$burst_game

ovs-vsctl set interface game-out1 ingress_policing_rate=$rate_game
ovs-vsctl set interface game-out1 ingress_policing_burst=$burst_game
