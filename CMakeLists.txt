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
find_package(assimp REQUIRED)

# Collect source files
file(GLOB SOURCES
  "src/*.cpp"
  "main.cpp"
)

# Create executable
add_executable(OGLRender ${SOURCES})

# Add include paths
target_include_directories(OGLRender
  PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/include
    ${CMAKE_CURRENT_SOURCE_DIR}/src
    ${CMAKE_CURRENT_SOURCE_DIR}/include/lib
    ${CMAKE_CURRENT_SOURCE_DIR}/include/stb
    ${CMAKE_CURRENT_SOURCE_DIR}/include/glm
    ${CMAKE_CURRENT_SOURCE_DIR}/include/json
)

# Link GLFW and GLAD
target_link_libraries(OGLRender
  PRIVATE
    glfw
    glad
    assimp::assimp
)
add_custom_command(TARGET OGLRender POST_BUILD
  COMMAND ${CMAKE_COMMAND} -E copy_directory
  ${CMAKE_SOURCE_DIR}/resources $<TARGET_FILE_DIR:OGLRender>/resources
)

