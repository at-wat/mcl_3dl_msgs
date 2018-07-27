cmake_minimum_required(VERSION 2.8.3)
project(mcl_3dl_msgs)

find_package(catkin REQUIRED
  COMPONENTS
    message_generation
    std_msgs
)

add_service_files(
  FILES
    ResizeParticle.srv
)
add_message_files(
  FILES
    Status.msg
)
generate_messages(
  DEPENDENCIES
    std_msgs
)

catkin_package(
  CATKIN_DEPENDS
    message_runtime
    std_msgs
)
