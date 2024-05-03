cmake_minimum_required(VERSION 3.5.0)
project(rendering_quickstart VERSION 0.1.0 LANGUAGES C CXX)

include(CTest)
enable_testing()
find_package(glfw3 REQUIRED)


add_executable(rendering_quickstart main.cpp glad.c)
target_link_libraries(rendering_quickstart glfw)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
