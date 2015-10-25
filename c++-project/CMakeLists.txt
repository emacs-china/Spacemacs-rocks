cmake_minimum_required(VERSION 2.8)
project (demo)

SET(CMAKE_CXX_FLAGS "-m32 -ggdb -D_DEBUG -Wall")

include_directories(
  ${CMAKE_CURRENT_SOURCE_DIR}/lib
)

file(GLOB LIBS "lib/*.cpp")
set(SOURCES main.cpp ${LIBS})

add_executable(demo ${SOURCES})
