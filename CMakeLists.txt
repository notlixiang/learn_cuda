cmake_minimum_required(VERSION 3.8)
project(learn_cuda LANGUAGES CXX CUDA)

add_compile_options(-std=c++11)
set(CMAKE_CXX_FLAGS "-march=native -O2 -Wall -pthread")
set(CMAKE_EXE_LINKER_FLAGS "-no-pie")

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
)

catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES learn_cuda
#  CATKIN_DEPENDS roscpp rospy std_msgs
#  DEPENDS system_lib
)

include_directories(
# include
  ${catkin_INCLUDE_DIRS}
)

add_library(cudaMatMul src/cudaMatMul.cu src/cudaMatMul.h)

add_executable(main src/main.cpp)
target_link_libraries(main cudaMatMul)
