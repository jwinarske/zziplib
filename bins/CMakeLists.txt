CMAKE_MINIMUM_REQUIRED(VERSION 2.8)

SET(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/../cmake)

if(POLICY CMP0048)
    cmake_policy(SET CMP0048 NEW)
endif()

PROJECT(bins VERSION "${PROJECT_VERSION}" LANGUAGES C)

INCLUDE(common_config)


ADD_EXECUTABLE(minzzip zzip.c zzipmake-zip.c )
TARGET_LINK_LIBRARIES(minzzip ${ZZIP_LIB} ${Z_LIB})
INSTALL (TARGETS minzzip RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX}/bin COMPONENT applications)
ADD_DEPENDENCIES( minzzip zzip )

set(instSourceFiles
    "${CMAKE_CURRENT_SOURCE_DIR}/zzcat.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/zzdir.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/zzxorcat.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/zzxordir.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/zzxorcopy.c"
)

foreach (instSourceFile IN LISTS instSourceFiles)
    get_filename_component(exeName ${instSourceFile} NAME_WE)
    add_executable(${exeName} ${instSourceFile})
    target_link_libraries(${exeName} ${ZZIP_LIB} ${Z_LIB})
    install (TARGETS ${exeName} RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX}/bin COMPONENT applications)
    add_dependencies(${exeName} zzip)
endforeach()

ADD_EXECUTABLE(unzzip unzzip.c unzzipcat-zip.c unzzipdir-zip.c)
TARGET_LINK_LIBRARIES(unzzip ${ZZIP_LIB} ${Z_LIB})
INSTALL (TARGETS unzzip RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX}/bin COMPONENT applications)
ADD_DEPENDENCIES( unzzip zzip )

ADD_EXECUTABLE(unzzip-mix unzzip.c unzzipcat-mix.c unzzipdir-mix.c)
TARGET_LINK_LIBRARIES(unzzip-mix ${ZZIP_LIB} ${Z_LIB})
INSTALL (TARGETS unzzip-mix RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX}/bin COMPONENT applications)
ADD_DEPENDENCIES( unzzip-mix zzip )

ADD_EXECUTABLE(unzzip-mem unzzip.c unzzipcat-mem.c unzzipdir-mem.c)
TARGET_LINK_LIBRARIES(unzzip-mem ${ZZIP_MAPPED} ${Z_LIB})
INSTALL (TARGETS unzzip-mem RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX}/bin COMPONENT applications)
ADD_DEPENDENCIES( unzzip-mem zzipmapped )

ADD_EXECUTABLE(unzzip-big unzzip.c unzzipcat-big.c unzzipdir-big.c)
TARGET_LINK_LIBRARIES(unzzip-big ${ZZIP_FSEEKO} ${Z_LIB})
INSTALL (TARGETS unzzip-big RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX}/bin COMPONENT applications)
ADD_DEPENDENCIES( unzzip-big zzipfseeko )

ADD_EXECUTABLE(unzip-mem unzip-mem.c)
TARGET_LINK_LIBRARIES(unzip-mem ${ZZIP_MAPPED} ${Z_LIB})
INSTALL (TARGETS unzip-mem RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX}/bin COMPONENT applications)
ADD_DEPENDENCIES( unzip-mem zzipmapped )


# non-install apps
set(noinstSourceFiles
    "${CMAKE_CURRENT_SOURCE_DIR}/zziptest.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/zzobfuscated.c"
)

foreach (noinstSourceFile IN LISTS noinstSourceFiles)
    get_filename_component(exeName ${noinstSourceFile} NAME_WE)
    add_executable(${exeName} ${noinstSourceFile})
    target_link_libraries(${exeName} ${ZZIP_LIB} ${Z_LIB})
    add_dependencies(${exeName} zzip)
endforeach()

IF (BUILD_TESTS)
enable_testing()
add_test(
    NAME check-readme 
    COMMAND zzcat "${CMAKE_SOURCE_DIR}/test/README > test.out"
)
ENDIF (BUILD_TESTS)