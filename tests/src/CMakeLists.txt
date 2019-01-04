cmake_minimum_required (VERSION 3.9)

add_compile_options(-Wall)
add_compile_options(-Werror)
add_compile_options(-O2)
add_compile_options(-fobjc-arc)

include_directories(${CMAKE_CURRENT_LIST_DIR}/../../include)
include_directories(SYSTEM ${CMAKE_CURRENT_LIST_DIR}/../vendor/include)

project (test)

add_executable(
  test
  test.m
)

target_link_libraries(
  test
  "-framework Cocoa"
)
