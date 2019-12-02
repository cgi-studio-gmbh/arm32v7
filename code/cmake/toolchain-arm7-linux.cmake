#----------------------------------------------------------------------------------------------------------------------------------------#
#///////// General //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////#
#----------------------------------------------------------------------------------------------------------------------------------------#
set(CMAKE_SYSTEM_PROCESSOR armv7l)
# Processors:
#  ${CMAKE_HOST_SYSTEM_PROCESSOR}
#  AMD64
#  armv6l
#  armv7l
#  i386
#  i686
#  x86
#  x86_64

set(CMAKE_SYSTEM_NAME Linux)
# System Names:
#  ${CMAKE_HOST_SYSTEM_NAME}
#  Linux
#  Windows

set(CMAKE_CXX_COMPILER arm-linux-gnueabihf-g++-8)
set(CMAKE_C_COMPILER   arm-linux-gnueabihf-gcc-8)

add_definitions(-DGLIBCXXUSECXX11_ABI=0)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
