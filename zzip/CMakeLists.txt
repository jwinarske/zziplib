CMAKE_MINIMUM_REQUIRED(VERSION 2.8)

SET(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/../cmake)

if(POLICY CMP0048)
    cmake_policy(SET CMP0048 NEW)
endif()

PROJECT(libs VERSION "${PROJECT_VERSION}" LANGUAGES C)

INCLUDE(get_dependent_libs)

SET(zzip_SOURCES
    zip.c
    file.c
    dir.c
    stat.c
    info.c
    err.c
    plugin.c
    write.c
    fetch.c
)

SET(zzip_headers
    stdint.h
    file.h
    plugin.h
    lib.h
    zzip.h
    zzip32.h
    write.h
    fetch.h
    format.h
    info.h
    types.h
)    


SET(zzipmmapped_SOURCES mmapped.c memdisk.c fetch.c)
SET(zzipmmapped_headers mmapped.h memdisk.h fetch.h)

SET(zzipfseeko_SOURCES fseeko.c fetch.c)
SET(zzipfseeko_headers fseeko.h fetch.h)

IF (BUILD_SHARED)
ADD_LIBRARY(zzip SHARED ${zzip_SOURCES} ${zzip_headers})
ADD_LIBRARY(zzipmapped SHARED ${zzipmmapped_SOURCES} ${zzipmmapped_headers})
ADD_LIBRARY(zzipfseeko SHARED ${zzipfseeko_SOURCES} ${zzipfseeko_headers})
INSTALL (TARGETS zzip ARCHIVE DESTINATION lib LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX}/lib COMPONENT libraries)
INSTALL (TARGETS zzipmapped ARCHIVE DESTINATION lib LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX}/lib COMPONENT libraries)
INSTALL (TARGETS zzipfseeko ARCHIVE DESTINATION lib LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX}/lib COMPONENT libraries)
TARGET_LINK_LIBRARIES(zzip -lz)
TARGET_LINK_LIBRARIES(zzipmapped -lz)
TARGET_LINK_LIBRARIES(zzipfseeko -lz)
ELSE ()
ADD_LIBRARY(zzip STATIC ${zzip_SOURCES} ${zzip_headers})
ADD_LIBRARY(zzipmapped STATIC ${zzipmmapped_SOURCES} ${zzipmmapped_headers})
ADD_LIBRARY(zzipfseeko STATIC ${zzipfseeko_SOURCES} ${zzipfseeko_headers})
INSTALL (TARGETS zzip ARCHIVE DESTINATION lib LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX} COMPONENT libraries)
INSTALL (TARGETS zzipmapped ARCHIVE DESTINATION lib LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX} COMPONENT libraries)
INSTALL (TARGETS zzipfseeko ARCHIVE DESTINATION lib LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX} COMPONENT libraries)
ENDIF ()

IF(NOT CYGWIN)
    # This property causes shared libraries on Linux to have the full version
    # encoded into their final filename.  We disable this on Cygwin because
    # it causes cygz-${ZLIB_FULL_VERSION}.dll to be created when cygz.dll
    # seems to be the default.
    SET_TARGET_PROPERTIES(zzipmapped PROPERTIES VERSION ${PROJECT_VERSION})
    SET_TARGET_PROPERTIES(zzipfseeko PROPERTIES VERSION ${PROJECT_VERSION})
    SET_TARGET_PROPERTIES(zzip PROPERTIES VERSION ${PROJECT_VERSION})
ENDIF()


if(ZZIP_CONFIGURE_INSTALL)
	INCLUDE(GNUInstallDirs)
MESSAGE(STATUS "CMAKE_CURRENT_SOURCE_DIR = ${CMAKE_CURRENT_SOURCE_DIR}")
MESSAGE(STATUS "CMAKE_CURRENT_BINARY_DIR = ${CMAKE_CURRENT_BINARY_DIR}")

   	INSTALL(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
		DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/zzip
		FILES_MATCHING PATTERN "*.h"
		PATTERN "__*.h" EXCLUDE)
	
    SET(INSTALL_LIB_DIR ${CMAKE_INSTALL_PREFIX}/lib)
    SET(INSTALL_INC_DIR ${CMAKE_INSTALL_PREFIX}/include)
    CONFIGURE_FILE(../cmake/zzip.pc.cmake.in libzzip.pc @ONLY)
    SET(INSTALL_PKGCONFIG_DIR "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" CACHE PATH "Installation directory for pkgconfig (.pc) files")
    INSTALL(FILES ${CMAKE_CURRENT_BINARY_DIR}/libzzip.pc DESTINATION "${INSTALL_PKGCONFIG_DIR}")
ENDIF()
