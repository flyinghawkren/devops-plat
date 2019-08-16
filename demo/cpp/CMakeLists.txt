cmake_minimum_required(VERSION 3.5)

project(demo)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
set(GTEST_DIR "~/develop/gtest")

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/inc ${GTEST_DIR}/inc)
file(GLOB_RECURSE SRC_FILES ${CMAKE_CURRENT_SOURCE_DIR}/src/*.*)
file(GLOB_RECURSE TEST_FILES ${CMAKE_CURRENT_SOURCE_DIR}/test/*.*)
set(MAIN_FILE main.cpp)

add_executable(${PROJECT_NAME} ${SRC_FILES} ${MAIN_FILE})

link_directories(${GTEST_DIR}/lib)
add_executable(${PROJECT_NAME}_test ${SRC_FILES} ${TEST_FILES})
target_link_libraries(${PROJECT_NAME}_test gtest gtest_main)
