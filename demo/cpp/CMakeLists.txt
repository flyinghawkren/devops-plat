cmake_minimum_required(VERSION 3.5)

project(demo)

SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

OPTION(ENABLE_GCOV "Enable gcov" OFF)
IF (ENABLE_GCOV)
  SET(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -fprofile-arcs -ftest-coverage")
  SET(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -fprofile-arcs -ftest-coverage")
  SET(CMAKE_EXE_LINKER_FLAGS_DEBUG "${CMAKE_EXE_LINKER_FLAGS_DEBUG} -fprofile-arcs -ftest-coverage -lgcov")
ENDIF()

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/inc)
file(GLOB_RECURSE SRC_FILES ${CMAKE_CURRENT_SOURCE_DIR}/src/*.*)
file(GLOB_RECURSE TEST_FILES ${CMAKE_CURRENT_SOURCE_DIR}/test/*.*)
set(MAIN_FILE main.cpp)

add_executable(${PROJECT_NAME} ${SRC_FILES} ${MAIN_FILE})
target_link_libraries(${PROJECT_NAME} pistache_static)

link_directories(${GTEST_DIR}/lib)
add_executable(${PROJECT_NAME}_test ${SRC_FILES} ${TEST_FILES})
target_link_libraries(${PROJECT_NAME}_test gtest gtest_main)
