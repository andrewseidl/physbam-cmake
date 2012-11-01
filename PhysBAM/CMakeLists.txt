cmake_minimum_required(VERSION 2.8)

project(PhysBAM)

# For non-multi-configuration generators (eg, make, Eclipse)
# The Visual Studio and XCode generators create a single project with all these
set(CMAKE_BUILD_TYPE "Release" CACHE STRING "For single-configuration generators (e.g. make) set the type of build: Release, Debug, RelWithDebugInfo, MinSizeRel")
set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Release" "Debug" "RelWithDebugInfo" "MinSizeRel")

message("${PhysBAM_BINARY_DIR}")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${PhysBAM_BINARY_DIR}/lib")
option(BUILD_SHARED_LIBS "Build as shared libraries by default" ON)

if (CMAKE_COMPILER_IS_GNUCC AND GCC_VERSION VERSION_GREATER 4.5)
		set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fpermissive")
endif()

set(PhysBAM_PL_DIR "${CMAKE_SOURCE_DIR}/Public_Library" CACHE PATH "Path to the PhysBAM Public_Library directory")

set(PhysBAM_Tools_DIR "${PhysBAM_PL_DIR}/PhysBAM_Tools" CACHE PATH "Path to the PhysBAM Public_Library/PhysBAM_Tools")
set(PhysBAM_Geometry_DIR "${PhysBAM_PL_DIR}/PhysBAM_Geometry" CACHE PATH "Path to the PhysBAM Public_Library/PhysBAM_Geometry")
set(PhysBAM_Rendering_DIR "${PhysBAM_PL_DIR}/PhysBAM_Rendering" CACHE PATH "Path to the PhysBAM Public_Library/PhysBAM_Rendering")


file(GLOB_RECURSE PhysBAM_Tools_SOURCE "${PhysBAM_Tools_DIR}/*.cpp")
file(GLOB_RECURSE PhysBAM_Tools_HEADER "${PhysBAM_Tools_DIR}/*.h")

file(GLOB_RECURSE PhysBAM_Geometry_SOURCE "${PhysBAM_Geometry_DIR}/*.cpp")
file(GLOB_RECURSE PhysBAM_Geometry_HEADER "${PhysBAM_Geometry_DIR}/*.h")

file(GLOB_RECURSE PhysBAM_Rendering_SOURCE "${PhysBAM_Geometry_DIR}/*.cpp")
file(GLOB_RECURSE PhysBAM_Rendering_HEADER "${PhysBAM_Geometry_DIR}/*.h")

set(PhysBAM_DOUBLE_SUPPORT 		FALSE 	CACHE 	BOOL 	"Turn ON to enable double support")
set(PhysBAM_DYADIC_SUPPORT 		FALSE 	CACHE 	BOOL 	"Turn ON to enable dyadic support")
set(PhysBAM_BINTREE_SUPPORT 	FALSE 	CACHE 	BOOL 	"Turn ON to enable bintree support")
set(PhysBAM_RLE_SUPPORT 		FALSE 	CACHE 	BOOL 	"Turn ON to enable RLE support")
set(PhysBAM_ZLIB_SUPPORT 		FALSE 	CACHE 	BOOL 	"Turn ON to enable zlib support")

IF (NOT PhysBAM_DOUBLE_SUPPORT)
	ADD_DEFINITIONS("-DCOMPILE_WITHOUT_DOUBLE_SUPPORT")
ENDIF()
IF (NOT PhysBAM_DYADIC_SUPPORT)
	ADD_DEFINITIONS("-DCOMPILE_WITHOUT_DYADIC_SUPPORT")
ENDIF()
IF (PhysBAM_BINTREE_SUPPORT)
	ADD_DEFINITIONS("-DCOMPILE_WITH_BINTREE_SUPPORT")
ENDIF()

IF (NOT PhysBAM_RLE_SUPPORT)
	ADD_DEFINITIONS("-DCOMPILE_WITHOUT_RLE_SUPPORT")
ENDIF()
IF (NOT PhysBAM_ZLIB_SUPPORT)
	ADD_DEFINITIONS("-DCOMPILE_WITHOUT_ZLIB_SUPPORT")
ENDIF()


include_directories(${PhysBAM_PL_DIR})

add_library(PhysBAM_Tools ${PhysBAM_Tools_SOURCE} ${PhysBAM_Tools_HEADER})
add_library(PhysBAM_Geometry ${PhysBAM_Geometry_SOURCE} ${PhysBAM_Geometry_HEADER})
add_library(PhysBAM_Rendering ${PhysBAM_Rendering_SOURCE} ${PhysBAM_Rendering_HEADER})

target_link_libraries(PhysBAM_Geometry PhysBAM_Tools)
target_link_libraries(PhysBAM_Rendering PhysBAM_Tools)

file(COPY ${PhysBAM_Tools_DIR} ${PhysBAM_Geometry_DIR} ${PhysBAM_Rendering_DIR}
		DESTINATION ${PhysBAM_BINARY_DIR}/include
		FILES_MATCHING PATTERN "*.h" )
