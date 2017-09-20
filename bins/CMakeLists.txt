CMAKE_MINIMUM_REQUIRED(VERSION 2.8)

SET(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/../cmake)

if(POLICY CMP0048)
    cmake_policy(SET CMP0048 NEW)
endif()

PROJECT(bins VERSION "${PROJECT_VERSION}" LANGUAGES C)

INCLUDE(get_dependent_libs)


ADD_EXECUTABLE(zzcat zzcat.c)
TARGET_LINK_LIBRARIES(zzcat -lzzip -lz)
INSTALL (TARGETS zzcat RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX}/bin COMPONENT applications)
ADD_DEPENDENCIES( zzcat zzip )

ADD_EXECUTABLE(zzdir zzdir.c)
TARGET_LINK_LIBRARIES(zzdir -lzzip -lz)
INSTALL (TARGETS zzdir RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX}/bin COMPONENT applications)
ADD_DEPENDENCIES( zzdir zzip )

ADD_EXECUTABLE(zzxorcat zzxorcat.c)
TARGET_LINK_LIBRARIES(zzxorcat -lzzip -lz)
INSTALL (TARGETS zzxorcat RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX}/bin COMPONENT applications)
ADD_DEPENDENCIES( zzxorcat zzip )

ADD_EXECUTABLE(zzxordir zzxordir.c)
TARGET_LINK_LIBRARIES(zzxordir -lzzip -lz)
INSTALL (TARGETS zzxordir RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX}/bin COMPONENT applications)
ADD_DEPENDENCIES( zzxordir zzip )

ADD_EXECUTABLE(zzxorcopy zzxorcopy.c)
TARGET_LINK_LIBRARIES(zzxorcopy -lzzip -lz)
INSTALL (TARGETS zzxorcopy RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX}/bin COMPONENT applications)
ADD_DEPENDENCIES( zzxorcopy zzip )

ADD_EXECUTABLE(unzzip unzzip.c unzzipcat-zip.c unzzipdir-zip.c)
TARGET_LINK_LIBRARIES(unzzip -lzzip -lz)
INSTALL (TARGETS unzzip RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX}/bin COMPONENT applications)
ADD_DEPENDENCIES( unzzip zzip )

ADD_EXECUTABLE(unzzip-mix unzzip.c unzzipcat-mix.c unzzipdir-mix.c)
TARGET_LINK_LIBRARIES(unzzip-mix -lzzip -lz)
INSTALL (TARGETS unzzip-mix RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX}/bin COMPONENT applications)
ADD_DEPENDENCIES( unzzip-mix zzip )

ADD_EXECUTABLE(unzzip-mem unzzip.c unzzipcat-mem.c unzzipdir-mem.c)
TARGET_LINK_LIBRARIES(unzzip-mem -lzzipmapped -lz)
INSTALL (TARGETS unzzip-mem RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX}/bin COMPONENT applications)
ADD_DEPENDENCIES( unzzip-mem zzipmapped )

ADD_EXECUTABLE(unzzip-big unzzip.c unzzipcat-big.c unzzipdir-big.c)
TARGET_LINK_LIBRARIES(unzzip-big -lzzipfseeko -lz)
INSTALL (TARGETS unzzip-big RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX}/bin COMPONENT applications)
ADD_DEPENDENCIES( unzzip-big zzipfseeko )

ADD_EXECUTABLE(unzip-mem unzip-mem.c)
TARGET_LINK_LIBRARIES(unzip-mem -lzzipmapped -lz)
INSTALL (TARGETS unzip-mem RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX}/bin COMPONENT applications)
ADD_DEPENDENCIES( unzip-mem zzipmapped )

# non-install apps
ADD_EXECUTABLE(zziptest zziptest.c)
TARGET_LINK_LIBRARIES(zziptest -lzzip -lz)
ADD_DEPENDENCIES( zziptest zzip )

ADD_EXECUTABLE(zzobfuscated zzobfuscated.c)
TARGET_LINK_LIBRARIES(zzobfuscated -lzzip -lz)
ADD_DEPENDENCIES( zzobfuscated zzip )

ADD_EXECUTABLE(_zzip zzip.c zzipmake-zip.c)
TARGET_LINK_LIBRARIES(_zzip -lzzip -lz)
ADD_DEPENDENCIES( _zzip zzip )


