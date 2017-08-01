CMAKE_MINIMUM_REQUIRED(VERSION 2.8)

PROJECT (bins)

SET(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/../cmake)
INCLUDE(Zzip)

link_directories(${ZZIP_LIBS})

INCLUDE_DIRECTORIES(${CMAKE_SOURCE_DIR})

ADD_EXECUTABLE(zzcat zzxorcat.c ${PROJECT_BINARY_DIR}/config.h)
TARGET_LINK_LIBRARIES(zzcat ${ZLIB_LIBRARIES} -lzzip)
INSTALL (TARGETS zzcat
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    COMPONENT applications
)

ADD_EXECUTABLE(zzdir zzdir.c ${PROJECT_BINARY_DIR}/config.h)
TARGET_LINK_LIBRARIES(zzdir ${ZLIB_LIBRARIES} -lzzip)
INSTALL (TARGETS zzdir
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    COMPONENT applications
)

ADD_EXECUTABLE(zzxorcat zzxorcat.c ${PROJECT_BINARY_DIR}/config.h)
TARGET_LINK_LIBRARIES(zzxorcat ${ZLIB_LIBRARIES} -lzzip)
INSTALL (TARGETS zzxorcat
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    COMPONENT applications
)

ADD_EXECUTABLE(zzxordir zzxordir.c ${PROJECT_BINARY_DIR}/config.h)
TARGET_LINK_LIBRARIES(zzxordir ${ZLIB_LIBRARIES} -lzzip)
INSTALL (TARGETS zzxordir
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    COMPONENT applications
)

ADD_EXECUTABLE(zzxorcopy zzxorcopy.c ${PROJECT_BINARY_DIR}/config.h)
TARGET_LINK_LIBRARIES(zzxorcopy ${ZLIB_LIBRARIES} -lzzip)
INSTALL (TARGETS zzxorcopy
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    COMPONENT applications
)

ADD_EXECUTABLE(unzzip unzzip.c unzzipcat-zip.c unzzipdir-zip.c ${PROJECT_BINARY_DIR}/config.h)
TARGET_LINK_LIBRARIES(unzzip ${ZLIB_LIBRARIES} -lzzip)
INSTALL (TARGETS unzzip
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    COMPONENT applications
)

ADD_EXECUTABLE(unzzip-mix unzzip.c unzzipcat-mix.c unzzipdir-mix.c ${PROJECT_BINARY_DIR}/config.h)
TARGET_LINK_LIBRARIES(unzzip-mix ${ZLIB_LIBRARIES} -lzzip)
INSTALL (TARGETS unzzip-mix
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    COMPONENT applications
)

ADD_EXECUTABLE(unzzip-mem unzzip.c unzzipcat-mem.c unzzipdir-mem.c ${PROJECT_BINARY_DIR}/config.h)
TARGET_LINK_LIBRARIES(unzzip-mem ${ZLIB_LIBRARIES} -lzzipmapped)
INSTALL (TARGETS unzzip-mem
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    COMPONENT applications
)

ADD_EXECUTABLE(unzzip-big unzzip.c unzzipcat-big.c unzzipdir-big.c ${PROJECT_BINARY_DIR}/config.h)
TARGET_LINK_LIBRARIES(unzzip-big ${ZLIB_LIBRARIES} -lzzipfseeko)
INSTALL (TARGETS unzzip-big
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    COMPONENT applications
)

ADD_EXECUTABLE(unzip-mem unzip-mem.c ${PROJECT_BINARY_DIR}/config.h)
TARGET_LINK_LIBRARIES(unzip-mem ${ZLIB_LIBRARIES} -lzzipmapped)
INSTALL (TARGETS unzzip-mem
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    COMPONENT applications
)

# non-install apps
ADD_EXECUTABLE(zziptest zziptest.c ${PROJECT_BINARY_DIR}/config.h)
TARGET_LINK_LIBRARIES(zziptest ${ZLIB_LIBRARIES} -lzzip)

ADD_EXECUTABLE(zzobfuscated zzobfuscated.c ${PROJECT_BINARY_DIR}/config.h)
TARGET_LINK_LIBRARIES(zzobfuscated ${ZLIB_LIBRARIES} -lzzip)

#ADD_EXECUTABLE(zzip zzip.c zzipmake-zip.c ${PROJECT_BINARY_DIR}/config.h)
#TARGET_LINK_LIBRARIES(zzip ${ZLIB_LIBRARIES} -lzzip)


set(CPACK_COMPONENTS_ALL applications)


