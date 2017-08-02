CMAKE_MINIMUM_REQUIRED(VERSION 2.8)
PROJECT (libs C)

SET(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/../cmake)
INCLUDE(Zzip)

SET(libzzip_SOURCES
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

SET(libzzip_headers
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

IF (BUILD_ZLIB)
INCLUDE_DIRECTORIES (${CMAKE_BINARY_DIR}/zlib)
ENDIF ()
INCLUDE_DIRECTORIES (${ZLIB_INCLUDE_DIR} ${CMAKE_SOURCE_DIR})

SET(libzzipmmapped_SOURCES mmapped.c memdisk.c fetch.c)
SET(libzzipmmapped_headers mmapped.h memdisk.h fetch.h)

SET(libzzipfseeko_SOURCES fseeko.c fetch.c)
SET(libzzipfseeko_headers fseeko.h fetch.h)

ADD_LIBRARY(zzipmapped_la STATIC ${libzzipmmapped_SOURCES} ${libzzipmmapped_headers})
ADD_LIBRARY(zzipfseeko_la STATIC ${libzzipfseeko_SOURCES} ${libzzipfseeko_headers})
ADD_LIBRARY(zzip_la STATIC ${libzzip_SOURCES} ${libzzip_headers})

TARGET_LINK_LIBRARIES(zzipmapped_la ${ZLIB_LIBRARIES})
TARGET_LINK_LIBRARIES(zzipfseeko_la ${ZLIB_LIBRARIES})
TARGET_LINK_LIBRARIES(zzip_la ${ZLIB_LIBRARIES} zzipmmapped_la zzipfseeko_la)

IF(NOT CYGWIN)
    # This property causes shared libraries on Linux to have the full version
    # encoded into their final filename.  We disable this on Cygwin because
    # it causes cygz-${ZLIB_FULL_VERSION}.dll to be created when cygz.dll
    # seems to be the default.
    SET_TARGET_PROPERTIES(zzipmapped_la PROPERTIES VERSION ${SRC_VER})
    SET_TARGET_PROPERTIES(zzipfseeko_la PROPERTIES VERSION ${SRC_VER})
    SET_TARGET_PROPERTIES(zzip_la PROPERTIES VERSION ${SRC_VER})
ENDIF()

INSTALL (TARGETS zzipmapped_la
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib
    COMPONENT libraries
)
INSTALL (TARGETS zzipfseeko_la
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib
    COMPONENT libraries
)
INSTALL (TARGETS zzip_la
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib
    COMPONENT libraries
)

set(CPACK_COMPONENTS_ALL libraries)
