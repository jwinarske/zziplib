CMAKE_MINIMUM_REQUIRED(VERSION 2.8)

PROJECT (libs)

SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DZZIP_VERSION=${ZZIP_VER}")

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

INCLUDE_DIRECTORIES(${CMAKE_SOURCE_DIR})

SET(libzzipmmapped_SOURCES mmapped.c memdisk.c fetch.c)
SET(libzzipmmapped_headers mmapped.h memdisk.h fetch.h)

SET(libzzipfseeko_SOURCES fseeko.c fetch.c)
SET(libzzipfseeko_headers fseeko.h fetch.h)

ADD_LIBRARY(zzipmapped STATIC ${libzzipmmapped_SOURCES} ${libzzipmmapped_headers} ${PROJECT_BINARY_DIR}/config.h)
ADD_LIBRARY(zzipfseeko STATIC ${libzzipfseeko_SOURCES} ${libzzipfseeko_headers} ${PROJECT_BINARY_DIR}/config.h)
ADD_LIBRARY(zzip STATIC ${libzzip_SOURCES} ${libzzip_headers} ${PROJECT_BINARY_DIR}/config.h)

TARGET_LINK_LIBRARIES(zzipmapped ${ZLIB_LIBRARIES})
TARGET_LINK_LIBRARIES(zzipfseeko ${ZLIB_LIBRARIES})
TARGET_LINK_LIBRARIES(zzip ${ZLIB_LIBRARIES} zzipmmapped zzipfseeko)

INSTALL (TARGETS zzipmapped
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib
    COMPONENT libraries
)
INSTALL (TARGETS zzipfseeko
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib
    COMPONENT libraries
)
INSTALL (TARGETS zzip
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib
    COMPONENT libraries
)

set(CPACK_COMPONENTS_ALL libraries)

