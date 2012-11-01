physbam-cmake
=============

CMake files for building PhysBAM and using it in your own code.

`PhysBAM/CMakeLists.txt` may be used to compile PhysBAM itself and optionally install/package it. Place this file at the same directory level as PhysBAM's Public_Library directory and run CMake.

`Modules/FindPhysBAM.cmake` is a CMake module which may be used via `find_package(PhysBAM)`.

`CMakeLists.txt` is for an example project which shows how to implement the above functionality.
