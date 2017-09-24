CMAKE_MINIMUM_REQUIRED(VERSION 2.8)

SET(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/../cmake)

if(POLICY CMP0048)
    cmake_policy(SET CMP0048 NEW)
endif()

PROJECT(test VERSION "${PROJECT_VERSION}" LANGUAGES C)

INCLUDE(common_config)


set(testSourceFiles
    "${CMAKE_CURRENT_SOURCE_DIR}/zzipself.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/zzipsetstub.c"
)

foreach (testSourceFile IN LISTS testSourceFiles)
    get_filename_component(exeName ${testSourceFile} NAME_WE)
    add_executable(${exeName} ${testSourceFile})
    target_link_libraries(${exeName} ${ZZIP_LIB} ${Z_LIB})
    install (TARGETS ${exeName} RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX}/bin COMPONENT applications)
    add_dependencies(${exeName} zzip)
endforeach()
