# Locate PhysBAM libraries
# This module defines
# PHYSBAM_LIBRARIES, the name of the libraries to link against
# PHYSBAM_FOUND, if false, do not try to link to PHYSBAM
# PHYSBAM_INCLUDE_DIR, where to find PhysBAM includes
#
# Created by Andrew Seidl.

set(PHYSBAM_DIR CACHE PATH "Path to the PhysBAM install directory")

FIND_PATH(PHYSBAM_INCLUDE_DIR PhysBAM_Tools/Arrays/ARRAY.h
		HINTS ${PHYSBAM_DIR}
		PATH_SUFFIXES include
		PATHS /usr/local /opt /Library/Frameworks
)

FIND_LIBRARY(PHYSBAM_TOOLS_LIBRARY
		NAMES PhysBAM_Tools
		HINTS ${PHYSBAM_DIR}
		PATH_SUFFIXES lib64 lib
		PATHS /usr/local /opt /Library/Frameworks
)
FIND_LIBRARY(PHYSBAM_GEOMETRY_LIBRARY
		NAMES PhysBAM_Geometry
		HINTS ${PHYSBAM_DIR}
		PATH_SUFFIXES lib64 lib
		PATHS /usr/local /opt /Library/Frameworks
)
FIND_LIBRARY(PHYSBAM_RENDERING_LIBRARY
		NAMES PhysBAM_Rendering
		HINTS ${PHYSBAM_DIR}
		PATH_SUFFIXES lib64 lib
		PATHS /usr/local /opt /Library/Frameworks
)

SET(PHYSBAM_LIBRARIES ${PHYSBAM_LIBRARIES}
		${PHYSBAM_TOOLS_LIBRARY}
		${PHYSBAM_GEOMETRY_LIBRARY}
		${PHYSBAM_RENDERING_LIBRARY}
)
SET(PHYSBAM_INCLUDE_DIR ${PHYSBAM_INCLUDE_DIR})
