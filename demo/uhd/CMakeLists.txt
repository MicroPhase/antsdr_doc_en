cmake_minimum_required(VERSION 2.8.7)

project(init_usrp)

find_package(PkgConfig REQUIRED)
pkg_check_modules(LIBIIO REQUIRED IMPORTED_TARGET uhd)

add_executable(init_usrp main.cpp)
target_link_libraries(init_usrp uhd)
