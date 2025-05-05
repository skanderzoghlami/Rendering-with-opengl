cmake_minimum_required(VERSION 3.10)
project(OGLRender)


include(FetchContent)

# GLFW
FetchContent_Declare(
  glfw
  GIT_REPOSITORY https://github.com/glfw/glfw.git
  GIT_TAG latest
)
set(GLFW_BUILD_WAYLAND OFF)
FetchContent_MakeAvailable(glfw)


# GLAD
FetchContent_Declare(
  glad
  GIT_REPOSITORY https://github.com/Dav1dde/glad.git
  GIT_TAG v0.1.36
)
FetchContent_MakeAvailable(glad)



set(CMAKE_CXX_STANDARD 17)

include_directories(include)

add_executable(OGLRender src/main.cpp)

target_link_libraries(OGLRender
  PRIVATE
    glfw
    glad
)

target_include_directories(OGLRender
  PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/src
)
