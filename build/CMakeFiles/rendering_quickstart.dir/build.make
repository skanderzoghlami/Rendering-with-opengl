# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.29

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = C:\msys64\mingw64\bin\cmake.exe

# The command to remove a file.
RM = C:\msys64\mingw64\bin\cmake.exe -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "C:\Users\skander\OneDrive\Bureau\OpenGL with python\real_rendering"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "C:\Users\skander\OneDrive\Bureau\OpenGL with python\real_rendering\build"

# Include any dependencies generated for this target.
include CMakeFiles/rendering_quickstart.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/rendering_quickstart.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/rendering_quickstart.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/rendering_quickstart.dir/flags.make

CMakeFiles/rendering_quickstart.dir/main.cpp.obj: CMakeFiles/rendering_quickstart.dir/flags.make
CMakeFiles/rendering_quickstart.dir/main.cpp.obj: C:/Users/skander/OneDrive/Bureau/OpenGL\ with\ python/real_rendering/main.cpp
CMakeFiles/rendering_quickstart.dir/main.cpp.obj: CMakeFiles/rendering_quickstart.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir="C:\Users\skander\OneDrive\Bureau\OpenGL with python\real_rendering\build\CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/rendering_quickstart.dir/main.cpp.obj"
	C:\msys64\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/rendering_quickstart.dir/main.cpp.obj -MF CMakeFiles\rendering_quickstart.dir\main.cpp.obj.d -o CMakeFiles\rendering_quickstart.dir\main.cpp.obj -c "C:\Users\skander\OneDrive\Bureau\OpenGL with python\real_rendering\main.cpp"

CMakeFiles/rendering_quickstart.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/rendering_quickstart.dir/main.cpp.i"
	C:\msys64\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "C:\Users\skander\OneDrive\Bureau\OpenGL with python\real_rendering\main.cpp" > CMakeFiles\rendering_quickstart.dir\main.cpp.i

CMakeFiles/rendering_quickstart.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/rendering_quickstart.dir/main.cpp.s"
	C:\msys64\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "C:\Users\skander\OneDrive\Bureau\OpenGL with python\real_rendering\main.cpp" -o CMakeFiles\rendering_quickstart.dir\main.cpp.s

CMakeFiles/rendering_quickstart.dir/glad.c.obj: CMakeFiles/rendering_quickstart.dir/flags.make
CMakeFiles/rendering_quickstart.dir/glad.c.obj: C:/Users/skander/OneDrive/Bureau/OpenGL\ with\ python/real_rendering/glad.c
CMakeFiles/rendering_quickstart.dir/glad.c.obj: CMakeFiles/rendering_quickstart.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir="C:\Users\skander\OneDrive\Bureau\OpenGL with python\real_rendering\build\CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/rendering_quickstart.dir/glad.c.obj"
	C:\msys64\mingw64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/rendering_quickstart.dir/glad.c.obj -MF CMakeFiles\rendering_quickstart.dir\glad.c.obj.d -o CMakeFiles\rendering_quickstart.dir\glad.c.obj -c "C:\Users\skander\OneDrive\Bureau\OpenGL with python\real_rendering\glad.c"

CMakeFiles/rendering_quickstart.dir/glad.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/rendering_quickstart.dir/glad.c.i"
	C:\msys64\mingw64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "C:\Users\skander\OneDrive\Bureau\OpenGL with python\real_rendering\glad.c" > CMakeFiles\rendering_quickstart.dir\glad.c.i

CMakeFiles/rendering_quickstart.dir/glad.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/rendering_quickstart.dir/glad.c.s"
	C:\msys64\mingw64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "C:\Users\skander\OneDrive\Bureau\OpenGL with python\real_rendering\glad.c" -o CMakeFiles\rendering_quickstart.dir\glad.c.s

# Object files for target rendering_quickstart
rendering_quickstart_OBJECTS = \
"CMakeFiles/rendering_quickstart.dir/main.cpp.obj" \
"CMakeFiles/rendering_quickstart.dir/glad.c.obj"

# External object files for target rendering_quickstart
rendering_quickstart_EXTERNAL_OBJECTS =

rendering_quickstart.exe: CMakeFiles/rendering_quickstart.dir/main.cpp.obj
rendering_quickstart.exe: CMakeFiles/rendering_quickstart.dir/glad.c.obj
rendering_quickstart.exe: CMakeFiles/rendering_quickstart.dir/build.make
rendering_quickstart.exe: C:/msys64/mingw64/lib/libglfw3.dll.a
rendering_quickstart.exe: CMakeFiles/rendering_quickstart.dir/linkLibs.rsp
rendering_quickstart.exe: CMakeFiles/rendering_quickstart.dir/objects1.rsp
rendering_quickstart.exe: CMakeFiles/rendering_quickstart.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir="C:\Users\skander\OneDrive\Bureau\OpenGL with python\real_rendering\build\CMakeFiles" --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable rendering_quickstart.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\rendering_quickstart.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/rendering_quickstart.dir/build: rendering_quickstart.exe
.PHONY : CMakeFiles/rendering_quickstart.dir/build

CMakeFiles/rendering_quickstart.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\rendering_quickstart.dir\cmake_clean.cmake
.PHONY : CMakeFiles/rendering_quickstart.dir/clean

CMakeFiles/rendering_quickstart.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" "C:\Users\skander\OneDrive\Bureau\OpenGL with python\real_rendering" "C:\Users\skander\OneDrive\Bureau\OpenGL with python\real_rendering" "C:\Users\skander\OneDrive\Bureau\OpenGL with python\real_rendering\build" "C:\Users\skander\OneDrive\Bureau\OpenGL with python\real_rendering\build" "C:\Users\skander\OneDrive\Bureau\OpenGL with python\real_rendering\build\CMakeFiles\rendering_quickstart.dir\DependInfo.cmake" "--color=$(COLOR)"
.PHONY : CMakeFiles/rendering_quickstart.dir/depend

