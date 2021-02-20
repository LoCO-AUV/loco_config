source /opt/ros/melodic/setup.bash
source ~/catkin_ws/devel/setup.bash

export ROS_HOSTNAME=192.168.210.44
export ROS_MASTER_URI=http://127.0.0.1:11311

roslaunch loco_launch right_cam.launch &
sleep 10
roslaunch loco_menu menu.launch 
