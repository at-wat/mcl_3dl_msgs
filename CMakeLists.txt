cmake_minimum_required(VERSION 3.5)
project(mcl_3dl_msgs)

find_package(ros_environment REQUIRED)

set(ROS_VERSION $ENV{ROS_VERSION})

if(${ROS_VERSION} EQUAL 1)

  set(MESSAGE_DEPENDS
    std_msgs
  )

  find_package(catkin REQUIRED COMPONENTS message_generation ${MESSAGE_DEPENDS})

  add_service_files(
    FILES
      ResizeParticle.srv
      LoadPCD.srv
  )
  add_message_files(
    FILES
      Status.msg
  )
  generate_messages(DEPENDENCIES ${MESSAGE_DEPENDS})
  catkin_package(CATKIN_DEPENDS message_runtime ${MESSAGE_DEPENDS})

elseif(${ROS_VERSION} EQUAL 2)

  if(NOT CMAKE_CXX_STANDARD)
    set(CMAKE_CXX_STANDARD_REQUIRED ON)
    set(CMAKE_CXX_STANDARD 17)
  endif()

  if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    add_compile_options(-Wall -Wextra -Wpedantic)
  endif()

  find_package(ament_cmake REQUIRED)
  find_package(builtin_interfaces REQUIRED)
  find_package(std_msgs REQUIRED)
  find_package(rosidl_default_generators REQUIRED)

  rosidl_generate_interfaces(${PROJECT_NAME}
    msg/Status.msg
    srv/LoadPCD.srv
    srv/ResizeParticle.srv
    DEPENDENCIES std_msgs
    ADD_LINTER_TESTS
  )

  ament_export_dependencies(rosidl_default_runtime)

  if(BUILD_TESTING)
    find_package(ament_lint_auto REQUIRED)
    ament_lint_auto_find_test_dependencies()
  endif()

  ament_package()

endif()