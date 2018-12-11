#!/bin/sh

# Install melodic-full
# TODO : make it possible to choose 

pip install empy
pip install nose
pip install catkin_pkg

# TODO : automatic answer to fucking 100 questions
pikaur -S ros-melodic-desktop

# Initialize rosdep
sudo rosdep init
rosdep update

echo "source /opt/ros/melodic/setup.zsh" >> ~/.zshrc
