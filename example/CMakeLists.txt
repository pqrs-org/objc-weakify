cmake_minimum_required (VERSION 3.9)

add_compile_options(-Wall)
add_compile_options(-Werror)
add_compile_options(-O2)
add_compile_options(-fobjc-arc)

project (example)

include_directories(${CMAKE_CURRENT_LIST_DIR}/../include)

add_executable(
  example
  main.m
)

target_link_libraries(
  example
  "-framework Cocoa"
)
