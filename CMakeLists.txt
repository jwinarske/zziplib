CMAKE_MINIMUM_REQUIRED(VERSION 2.8)

IF(NOT BUILD_ZLIB)
    FIND_PACKAGE(PkgConfig)
ENDIF()
FIND_PACKAGE(Git REQUIRED)

SET(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_SOURCE_DIR}/cmake)

if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "Release" CACHE STRING "Choose the type of build, options are: DEBUG, RELEASE, or MINSIZEREL." FORCE)
    message("No build type specified, defaulting to Release.")
endif()

OPTION (BUILD_SHARED "Build shared libs" ON)
OPTION (BUILD_ONLY_LIBS "Only build libraries" OFF)
OPTION (BUILD_TESTS "Enable building tests" ON)
OPTION (BUILD_ZLIB "Enable building zlib" OFF)
OPTION (ZZIP_CONFIGURE_INSTALL "Install Package" ON)
OPTION (USE_MMAP "Use memmap" OFF)
OPTION (LOWSTACK "" OFF)
OPTION (LARGEFILE_SOURCE "" OFF)
OPTION (ZZIP_EASY "" OFF)
OPTION (ZZIP_HARDEN "" OFF)
OPTION (ZZIP_ALLOW_MODULO_ENTRIES "" OFF)
OPTION (ZZIP_ENABLE_WRITE "Enable writing..." OFF)

set(CMAKE_LEGACY_CYGWIN_WIN32 0) # Remove when CMake >= 2.8.4 is required

INCLUDE(git_label_version)

if(POLICY CMP0028)
    cmake_policy(SET CMP0028 NEW)
endif()
if(POLICY CMP0048)
    cmake_policy(SET CMP0048 NEW)
endif()
if(POLICY CMP0054)
    cmake_policy(SET CMP0054 NEW)
endif()
if(POLICY CMP0056)
    cmake_policy(SET CMP0056 NEW)
endif()

set(CMAKE_LEGACY_CYGWIN_WIN32 0)

PROJECT(zzip VERSION "${PROJECT_VERSION}" LANGUAGES C)

INCLUDE(gen_config_header)
INCLUDE(build_external)

ADD_SUBDIRECTORY("zzip")

IF(NOT BUILD_ONLY_LIBS)
    ADD_SUBDIRECTORY("bins")
    IF(BUILD_TESTS)
        ADD_SUBDIRECTORY("test")
    ENDIF(BUILD_TESTS)
    ADD_SUBDIRECTORY("zzipwrap")
ENDIF(NOT BUILD_ONLY_LIBS)

ADD_CUSTOM_TARGET(uninstall "${CMAKE_COMMAND}" -P "${CMAKE_SOURCE_DIR}/cmake/make_uninstall.cmake")

IF(BUILD_ZLIB)
add_dependencies(zzip ZLIB)
ENDIF (BUILD_ZLIB)
