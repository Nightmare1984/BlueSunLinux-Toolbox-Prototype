# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.31

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

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/nightmare1984/Documents/BlueSunLinux-Toolbox

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/nightmare1984/Documents/BlueSunLinux-Toolbox/build

# Include any dependencies generated for this target.
include CMakeFiles/BlueSunLinux-Toolbox.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/BlueSunLinux-Toolbox.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/BlueSunLinux-Toolbox.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/BlueSunLinux-Toolbox.dir/flags.make

CMakeFiles/BlueSunLinux-Toolbox.dir/codegen:
.PHONY : CMakeFiles/BlueSunLinux-Toolbox.dir/codegen

CMakeFiles/BlueSunLinux-Toolbox.dir/BlueSunLinux-Toolbox.c.o: CMakeFiles/BlueSunLinux-Toolbox.dir/flags.make
CMakeFiles/BlueSunLinux-Toolbox.dir/BlueSunLinux-Toolbox.c.o: /home/nightmare1984/Documents/BlueSunLinux-Toolbox/BlueSunLinux-Toolbox.c
CMakeFiles/BlueSunLinux-Toolbox.dir/BlueSunLinux-Toolbox.c.o: CMakeFiles/BlueSunLinux-Toolbox.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/nightmare1984/Documents/BlueSunLinux-Toolbox/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/BlueSunLinux-Toolbox.dir/BlueSunLinux-Toolbox.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/BlueSunLinux-Toolbox.dir/BlueSunLinux-Toolbox.c.o -MF CMakeFiles/BlueSunLinux-Toolbox.dir/BlueSunLinux-Toolbox.c.o.d -o CMakeFiles/BlueSunLinux-Toolbox.dir/BlueSunLinux-Toolbox.c.o -c /home/nightmare1984/Documents/BlueSunLinux-Toolbox/BlueSunLinux-Toolbox.c

CMakeFiles/BlueSunLinux-Toolbox.dir/BlueSunLinux-Toolbox.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/BlueSunLinux-Toolbox.dir/BlueSunLinux-Toolbox.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/nightmare1984/Documents/BlueSunLinux-Toolbox/BlueSunLinux-Toolbox.c > CMakeFiles/BlueSunLinux-Toolbox.dir/BlueSunLinux-Toolbox.c.i

CMakeFiles/BlueSunLinux-Toolbox.dir/BlueSunLinux-Toolbox.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/BlueSunLinux-Toolbox.dir/BlueSunLinux-Toolbox.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/nightmare1984/Documents/BlueSunLinux-Toolbox/BlueSunLinux-Toolbox.c -o CMakeFiles/BlueSunLinux-Toolbox.dir/BlueSunLinux-Toolbox.c.s

# Object files for target BlueSunLinux-Toolbox
BlueSunLinux__Toolbox_OBJECTS = \
"CMakeFiles/BlueSunLinux-Toolbox.dir/BlueSunLinux-Toolbox.c.o"

# External object files for target BlueSunLinux-Toolbox
BlueSunLinux__Toolbox_EXTERNAL_OBJECTS =

libBlueSunLinux-Toolbox.a: CMakeFiles/BlueSunLinux-Toolbox.dir/BlueSunLinux-Toolbox.c.o
libBlueSunLinux-Toolbox.a: CMakeFiles/BlueSunLinux-Toolbox.dir/build.make
libBlueSunLinux-Toolbox.a: CMakeFiles/BlueSunLinux-Toolbox.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/nightmare1984/Documents/BlueSunLinux-Toolbox/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C static library libBlueSunLinux-Toolbox.a"
	$(CMAKE_COMMAND) -P CMakeFiles/BlueSunLinux-Toolbox.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/BlueSunLinux-Toolbox.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/BlueSunLinux-Toolbox.dir/build: libBlueSunLinux-Toolbox.a
.PHONY : CMakeFiles/BlueSunLinux-Toolbox.dir/build

CMakeFiles/BlueSunLinux-Toolbox.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/BlueSunLinux-Toolbox.dir/cmake_clean.cmake
.PHONY : CMakeFiles/BlueSunLinux-Toolbox.dir/clean

CMakeFiles/BlueSunLinux-Toolbox.dir/depend:
	cd /home/nightmare1984/Documents/BlueSunLinux-Toolbox/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/nightmare1984/Documents/BlueSunLinux-Toolbox /home/nightmare1984/Documents/BlueSunLinux-Toolbox /home/nightmare1984/Documents/BlueSunLinux-Toolbox/build /home/nightmare1984/Documents/BlueSunLinux-Toolbox/build /home/nightmare1984/Documents/BlueSunLinux-Toolbox/build/CMakeFiles/BlueSunLinux-Toolbox.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/BlueSunLinux-Toolbox.dir/depend

