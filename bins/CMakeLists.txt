CMAKE_MINIMUM_REQUIRED(VERSION 2.8)

PROJECT (bins)

SET(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/../cmake)
INCLUDE(Zzip)

LINK_DIRECTORIES(${ZZIP_LIBS})

INCLUDE_DIRECTORIES(${CMAKE_SOURCE_DIR})

ADD_EXECUTABLE(zzcat zzxorcat.c)
TARGET_LINK_LIBRARIES(zzcat ${ZLIB_LIBRARIES} -lzzip_la)
INSTALL (TARGETS zzcat RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR} COMPONENT applications)
ADD_DEPENDENCIES( zzcat zzip_la )

ADD_EXECUTABLE(zzdir zzdir.c)
TARGET_LINK_LIBRARIES(zzdir ${ZLIB_LIBRARIES} -lzzip_la)
INSTALL (TARGETS zzdir RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR} COMPONENT applications)
ADD_DEPENDENCIES( zzdir zzip_la )

ADD_EXECUTABLE(zzxorcat zzxorcat.c)
TARGET_LINK_LIBRARIES(zzxorcat ${ZLIB_LIBRARIES} -lzzip_la)
INSTALL (TARGETS zzxorcat RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR} COMPONENT applications)
ADD_DEPENDENCIES( zzxorcat zzip_la )

ADD_EXECUTABLE(zzxordir zzxordir.c)
TARGET_LINK_LIBRARIES(zzxordir ${ZLIB_LIBRARIES} -lzzip_la)
INSTALL (TARGETS zzxordir RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR} COMPONENT applications)
ADD_DEPENDENCIES( zzxordir zzip_la )

ADD_EXECUTABLE(zzxorcopy zzxorcopy.c)
TARGET_LINK_LIBRARIES(zzxorcopy ${ZLIB_LIBRARIES} -lzzip_la)
INSTALL (TARGETS zzxorcopy RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR} COMPONENT applications)
ADD_DEPENDENCIES( zzxorcopy zzip_la )

ADD_EXECUTABLE(unzzip unzzip.c unzzipcat-zip.c unzzipdir-zip.c)
TARGET_LINK_LIBRARIES(unzzip ${ZLIB_LIBRARIES} -lzzip_la)
INSTALL (TARGETS unzzip RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR} COMPONENT applications)
ADD_DEPENDENCIES( unzzip zzip_la )

ADD_EXECUTABLE(unzzip-mix unzzip.c unzzipcat-mix.c unzzipdir-mix.c)
TARGET_LINK_LIBRARIES(unzzip-mix ${ZLIB_LIBRARIES} -lzzip_la)
INSTALL (TARGETS unzzip-mix RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR} COMPONENT applications)
ADD_DEPENDENCIES( unzzip-mix zzip_la )

ADD_EXECUTABLE(unzzip-mem unzzip.c unzzipcat-mem.c unzzipdir-mem.c)
TARGET_LINK_LIBRARIES(unzzip-mem ${ZLIB_LIBRARIES} -lzzipmapped_la)
INSTALL (TARGETS unzzip-mem RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR} COMPONENT applications)
ADD_DEPENDENCIES( unzzip-mem zzipmapped_la )

ADD_EXECUTABLE(unzzip-big unzzip.c unzzipcat-big.c unzzipdir-big.c)
TARGET_LINK_LIBRARIES(unzzip-big ${ZLIB_LIBRARIES} -lzzipfseeko_la)
INSTALL (TARGETS unzzip-big RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR} COMPONENT applications)
ADD_DEPENDENCIES( unzzip-big zzipfseeko_la )

ADD_EXECUTABLE(unzip-mem unzip-mem.c)
TARGET_LINK_LIBRARIES(unzip-mem ${ZLIB_LIBRARIES} -lzzipmapped_la)
INSTALL (TARGETS unzip-mem RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR} COMPONENT applications)
ADD_DEPENDENCIES( unzip-mem zzipmapped_la )

# non-install apps
ADD_EXECUTABLE(zziptest zziptest.c)
TARGET_LINK_LIBRARIES(zziptest ${ZLIB_LIBRARIES} -lzzip_la)
ADD_DEPENDENCIES( zziptest zzip_la )

ADD_EXECUTABLE(zzobfuscated zzobfuscated.c)
TARGET_LINK_LIBRARIES(zzobfuscated ${ZLIB_LIBRARIES} -lzzip_la)
ADD_DEPENDENCIES( zzobfuscated zzip_la )

ADD_EXECUTABLE(zzip zzip.c zzipmake-zip.c)
TARGET_LINK_LIBRARIES(zzip ${ZLIB_LIBRARIES} -lzzip_la)
ADD_DEPENDENCIES( zzip zzip_la )


set(CPACK_COMPONENTS_ALL applications)

