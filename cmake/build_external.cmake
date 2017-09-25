if(BUILD_ZLIB)

    include(ExternalProject)

  
    set(ZLIB_SOURCE_DIR ${CMAKE_BINARY_DIR}/zlib CACHE INTERNAL "zlib source dir")

    ExternalProject_Add(ZLIB
        GIT_REPOSITORY "https://github.com/madler/zlib.git"
        GIT_TAG "v1.2.11"
        UPDATE_COMMAND ""
        DOWNLOAD_DIR ${CMAKE_CURRENT_BINARY_DIR}
        SOURCE_DIR ${ZLIB_SOURCE_DIR}
        BUILD_IN_SOURCE 1
        CMAKE_ARGS
            -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}
            -DCMAKE_CXX_FLAGS=${EXTERNAL_CXX_FLAGS}
            -DCMAKE_C_FLAGS=${EXTERNAL_C_FLAGS}
            -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
            -DBUILD_SHARED_LIBS=${BUILD_SHARED}
            -DAMD64=${ZLIB_AMD64}
            -DASM686=${ZLIB_ASM686}
        )

    INCLUDE_DIRECTORIES(${ZLIB_SOURCE_DIR})
    LINK_DIRECTORIES(${CMAKE_INSTALL_PREFIX}/lib)

endif()
