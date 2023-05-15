cmake_minimum_required(VERSION 3.8)

project(test)

add_definitions(-std=c++14)
set (CMAKE_CXX_STANDARD 14)

if (DEFINED EMSCRIPTEN)
    add_executable(calc src/calc.cpp src/calc.hpp)

    set(CMAKE_EXECUTABLE_SUFFIX ".wasm")

    set_target_properties(calc PROPERTIES COMPILE_FLAGS "-Os -s SIDE_MODULE=1 ")
    set_target_properties(calc PROPERTIES LINK_FLAGS    "-Os -s WASM=1 -s SIDE_MODULE=1 -s STANDALONE_WASM --no-entry")
else()
    # add_library(calc SHARED src/calc.cpp)
    add_library(calc STATIC src/calc.cpp)
endif()