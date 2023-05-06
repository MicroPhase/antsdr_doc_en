cmake_minimum_required(VERSION 2.8.7)

project(iio_stream C)


find_package(PkgConfig REQUIRED)
pkg_check_modules(LIBIIO REQUIRED IMPORTED_TARGET libiio)

add_executable(iio_stream main.c)
target_link_libraries(iio_stream iio)
