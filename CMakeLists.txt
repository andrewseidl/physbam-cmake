cmake_minimum_required(VERSION 2.8)

project(example_project)

# For non-multi-configuration generators (eg, make, Eclipse)
# The Visual Studio and XCode generators create a single project with all these
set(CMAKE_BUILD_TYPE "Release" CACHE STRING "For single-configuration generators (e.g. make) set the type of build: Release, Debug, RelWithDebugInfo, MinSizeRel")
set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Release" "Debug" "RelWithDebugInfo" "MinSizeRel")

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/Modules/")

if (CMAKE_COMPILER_IS_GNUCC AND GCC_VERSION VERSION_GREATER 4.5)
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fpermissive")
endif()

find_package(PhysBAM REQUIRED)

include_directories(${PHYSBAM_INCLUDE_DIR})

add_executable(example example.cpp)
target_link_libraries(example ${PHYSBAM_LIBRARIES})
