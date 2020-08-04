ARG ROS_DISTRO=kinetic
FROM ros:${ROS_DISTRO}-ros-core

RUN sed -e \
  's|http://archive\.ubuntu\.com|http://us-east-1.ec2.archive.ubuntu.com|' \
  -i /etc/apt/sources.list

RUN apt-get -qq update \
  && apt-get install -y --no-install-recommends \
    libxml2-utils \
    python-pip \
    python-rosdep \
    sudo \
    wget \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
RUN pip install catkin_lint

RUN rosdep init \
  && rosdep update \
  && mkdir -p /catkin_ws/src \
  && cd /catkin_ws/src \
  && . /opt/ros/${ROS_DISTRO}/setup.sh \
  && catkin_init_workspace

COPY ./package.xml /catkin_ws/src/mcl_3dl_msgs/package.xml
RUN apt-get -qq update \
  && rosdep install --from-paths /catkin_ws/src --ignore-src --rosdistro=${ROS_DISTRO} -y \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

COPY . /catkin_ws/src/mcl_3dl_msgs
COPY .travis/gh-pr-comment /usr/local/bin/
