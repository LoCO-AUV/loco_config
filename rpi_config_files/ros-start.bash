#!/bin/bash
source /opt/ros/melodic/setup.bash
source /home/irvlab/catkin_ws/devel/setup.bash

export ROS_HOSTNAME=192.168.210.43
export ROS_MASTER_URI=http://192.168.210.44:11311


sleep 10
roslaunch mavros apm.launch &
sleep 5
roslaunch robot_localization edgebot.launch &
sleep 10
roslaunch loco_pilot autopilot.launch &
sleep 10
roslaunch loco_launch left_cam.launch
