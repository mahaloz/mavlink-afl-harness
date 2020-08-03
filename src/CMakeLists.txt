cmake_minimum_required(VERSION 3.5)

set(CMAKE_C_COMPILER "/home/mahaloz/fuzzing-capstone/mavlink-fuzz-testing/src/AFL/afl-gcc")
set(CMAKE_CXX_COMPILER "/home/mahaloz/fuzzing-capstone/mavlink-fuzz-testing/src/AFL/afl-g++")
set(CMAKE_CXX_STANDARD 14)

set(CMAKE_CXX_FLAGS -static)

project(mavlink_fuzz_testing)

include_directories(../generated/include/mavlink/v2.0)

add_executable(parser_brute_force
    parser_brute_force.cpp
)

#add_executable(parser_with_random_message
#    parser_with_random_message.cpp
#)

#add_executable(parser_with_assembled_message
#    parser_with_assembled_message.cpp
#)
