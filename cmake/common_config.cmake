IF (NOT BUILD_ZLIB)
    IF (PKG_CONFIG_FOUND)
        PKG_CHECK_MODULES(ZLIB zlib)
        IF (ZLIB_FOUND)
            INCLUDE_DIRECTORIES(${ZLIB_INCLUDE_DIRS})
            LINK_DIRECTORIES(${ZLIB_LIBRARY_DIRS})
        ELSE (ZLIB_FOUND)
            MESSAGE(STATUS "Did not find zlib pkgconfig..." )
        ENDIF (ZLIB_FOUND)
    ELSE ()
        FIND_PACKAGE(ZLIB)
        INCLUDE_DIRECTORIES(${ZLIB_INCLUDE_DIR})
        LINK_DIRECTORIES(${ZLIB_LIBRARY_DIR})
    ENDIF ()
ENDIF ()

IF (MSVC)
    IF (BUILD_SHARED)
        IF(CMAKE_BUILD_TYPE STREQUAL "Debug")
            SET(Z_LIB zlibd)
        ELSE ()
            SET(Z_LIB zlib)
        ENDIF ()
    ELSE (BUILD_SHARED)
        IF(CMAKE_BUILD_TYPE STREQUAL "Debug")
            SET(Z_LIB zlibstaticd)
        ELSE ()
            SET(Z_LIB zlibstatic)
        ENDIF ()
    ENDIF (BUILD_SHARED)
    SET(ZZIP_LIB zzip)
    SET(ZZIP_MAPPED zzipmapped)
    SET(ZZIP_FSEEKO zzipfseeko)
ELSE ()
    SET(Z_LIB -lz)
    SET(ZZIP_LIB -lzzip)
    SET(ZZIP_MAPPED -lzzipmapped)
    SET(ZZIP_FSEEKO -lzzipfseeko)
ENDIF ()

INCLUDE_DIRECTORIES(${CMAKE_SOURCE_DIR})
INCLUDE_DIRECTORIES(${CMAKE_BINARY_DIR})

LINK_DIRECTORIES(${CMAKE_BINARY_DIR}/zzip)

IF(CMAKE_BUILD_TYPE STREQUAL "Debug")
    ADD_DEFINITIONS(-DDEBUG)
ENDIF ()

IF (MSVC AND BUILD_SHARED)
    ADD_DEFINITIONS(-DZZIP_EXPORTS)
ENDIF ()
IF(USE_MMAP)
    ADD_DEFINITIONS(-D_USE_MMAP)
ENDIF(USE_MMAP)
IF(LOWSTK)
    ADD_DEFINITIONS(-D_LOWSTK)
ENDIF(LOWSTK)
IF(LARGEFILE_SOURCE)
    ADD_DEFINITIONS(-D_LARGEFILE_SOURCE)
ENDIF(LARGEFILE_SOURCE)
IF(ZZIP_EASY)
    ADD_DEFINITIONS(-DZZIP_EASY)
ENDIF(ZZIP_EASY)
IF(ZZIP_HARDEN)
    ADD_DEFINITIONS(-DZZIP_HARDEN)
ENDIF(ZZIP_HARDEN)
IF(ZZIP_ALLOW_MODULO_ENTRIES)
    ADD_DEFINITIONS(-DZZIP_ALLOW_MODULO_ENTRIES)
ENDIF(ZZIP_ALLOW_MODULO_ENTRIES)
IF(ZZIP_ENABLE_WRITE)
    ADD_DEFINITIONS(-D_ZZIP_ENABLE_WRITE)
ENDIF(ZZIP_ENABLE_WRITE)

IF(MSVC)
    ADD_DEFINITIONS(-D_CRT_SECURE_NO_WARNINGS)
    SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} /wd4100 /wd4996 /wd4244 /wd4706 /wd4702 /wd4127 /wd4701")
ELSEIF(UNIX)
    SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fomit-frame-pointer -Wall -Wpointer-arith -Wsign-compare -Wmissing-declarations -Wdeclaration-after-statement -Werror-implicit-function-declaration -Wstrict-aliasing -Warray-bounds -Wstrict-prototypes")
ENDIF()


# Determine the platform and compiler dependent flags.
if (UNIX)
set(CXX_PLATFORM_DEPENDENT_FLAGS_DEBUG      "-DDEBUG -Wall -Wsign-compare -g")
set(CXX_PLATFORM_DEPENDENT_FLAGS_RELEASE    "-DNDEBUG -Wall -O2")
set(CXX_PLATFORM_DEPENDENT_FLAGS_MINSIZEREL "-DNDEBUG -Wall -Os")
elseif(MSVC)
set(CXX_PLATFORM_DEPENDENT_FLAGS_DEBUG      "/DDEBUG /W4 /Zi")
set(CXX_PLATFORM_DEPENDENT_FLAGS_RELEASE    "/DNDEBUG /W4 /O2")
set(CXX_PLATFORM_DEPENDENT_FLAGS_MINSIZEREL "/DNDEBUG /W4 /O1")
endif()

# Debug build, default.
set(CMAKE_CXX_FLAGS_DEBUG "${CXX_PLATFORM_DEPENDENT_FLAGS_DEBUG}" CACHE INTERNAL "Flags used for DEBUG builds" FORCE)
set(CMAKE_C_FLAGS_DEBUG ${CMAKE_CXX_FLAGS_DEBUG} CACHE INTERNAL "Flags used for DEBUG builds" FORCE)

# Release build.
set(CMAKE_CXX_FLAGS_RELEASE "${CXX_PLATFORM_DEPENDENT_FLAGS_RELEASE}" CACHE INTERNAL "Flags used for RELEASE builds" FORCE)
set(CMAKE_C_FLAGS_RELEASE ${CMAKE_CXX_FLAGS_RELEASE} CACHE INTERNAL "Flags used for RELEASE builds" FORCE)

# Minimum sized release build.
set(CMAKE_CXX_FLAGS_MINSIZEREL "${CXX_PLATFORM_DEPENDENT_FLAGS_MINSIZEREL}" CACHE INTERNAL "Flags used for minimum sized RELEASE builds" FORCE)
set(CMAKE_C_FLAGS_MINSIZEREL ${CMAKE_CXX_FLAGS_RELEASE} CACHE INTERNAL "Flags used for minimum sized RELEASE builds" FORCE)
