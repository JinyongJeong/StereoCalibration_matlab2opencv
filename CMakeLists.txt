cmake_minimum_required(VERSION 2.8.11)
project(CALIB_CAM)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

find_package(OpenCV REQUIRED)
include_directories($(OpenCV_INCLUDE_DIRS))



add_executable(calculate_rectification calculate_rectification.cpp)
target_link_libraries(calculate_rectification ${OpenCV_LIBS} "-lpopt")
