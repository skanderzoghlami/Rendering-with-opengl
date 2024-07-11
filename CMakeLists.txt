cmake_minimum_required(VERSION 3.5.0)
project(rendering_quickstart VERSION 0.1.0 LANGUAGES C CXX)

include(CTest)
enable_testing()
find_package(glfw3 REQUIRED)
find_package(Assimp REQUIRED)
find_package(OpenGL REQUIRED)

set(IMGUI_DIR ${CMAKE_SOURCE_DIR}/external/imgui)
include_directories(${IMGUI_DIR} ${IMGUI_DIR}/backends)
file(GLOB IMGUI_SOURCES ${IMGUI_DIR}/*.cpp ${IMGUI_DIR}/backends/imgui_impl_glfw.cpp ${IMGUI_DIR}/backends/imgui_impl_opengl3.cpp)
add_library(ImGui STATIC ${IMGUI_SOURCES})
target_include_directories(ImGui PUBLIC ${IMGUI_DIR})
target_link_libraries(ImGui PUBLIC glfw OpenGL::GL)

add_executable(rendering_quickstart main.cpp glad.c)

target_link_libraries(rendering_quickstart glfw ${ASSIMP_LIBRARIES})

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
