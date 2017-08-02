
FIND_PACKAGE(ZLIB REQUIRED)
IF (ZLIB_FOUND)
  MESSAGE(STATUS "ZLIB_INCLUDE_DIR: ${ZLIB_INCLUDE_DIR}")
  MESSAGE(STATUS "ZLIB_LIBRARY: ${ZLIB_LIBRARY}")
ELSE ()
  MESSAGE(STATUS "Did not find zlib..." )
ENDIF ()

INCLUDE(GNUInstallDirs)
INCLUDE(CheckIncludeFiles)
INCLUDE(CheckFunctionExists)
INCLUDE(CheckTypeSize)

OPTION(USE_MMAP "" OFF)
OPTION(LOWSTACK "" OFF)
OPTION(LARGEFILE_SOURCE "" OFF)
OPTION(ZZIP_EASY "" OFF)
OPTION(ZZIP_HARDEN "" OFF)
OPTION(ZZIP_ALLOW_MODULO_ENTRIES "" OFF)

IF(USE_MMAP)
  SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D_USE_MMAP")
ENDIF()
IF(LOWSTK)
  SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D_LOWSTK")
ENDIF()
IF(LARGEFILE_SOURCE)
  SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D_LARGEFILE_SOURCE")
ENDIF()
IF(ZZIP_EASY)
  SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DZZIP_EASY")
ENDIF()
IF(ZZIP_HARDEN)
  SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DZZIP_HARDEN")  
ENDIF()
IF(ZZIP_ALLOW_MODULO_ENTRIES)
  SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DZZIP_ALLOW_MODULO_ENTRIES")  
ENDIF()


# Configuration
CHECK_TYPE_SIZE(short SIZEOF_SHORT)
CHECK_TYPE_SIZE(int SIZEOF_INT)
CHECK_TYPE_SIZE(long SIZEOF_LONG)
CHECK_TYPE_SIZE(__int64 SIZEOF___INT64)
CHECK_TYPE_SIZE(off64_t SIZEOF_OFF64_T)
CHECK_TYPE_SIZE(off_t SIZEOF_OFF_T)
CHECK_TYPE_SIZE(size_t SIZEOF_SIZE_T)
CHECK_TYPE_SIZE(ssize_t SIZEOF_SSIZE_T)

CHECK_INCLUDE_FILES(byteswap.h ZZIP_HAVE_BYTESWAP_H)
CHECK_INCLUDE_FILES(direct.h ZZIP_HAVE_DIRECT_H)
CHECK_INCLUDE_FILES(dirent.h ZZIP_HAVE_DIRENT_H)
CHECK_INCLUDE_FILES(dlfcn.h ZZIP_HAVE_DLFCN_H)
CHECK_INCLUDE_FILES(fnmatch.h ZZIP_HAVE_FNMATCH_H)
CHECK_INCLUDE_FILES(inttypes.h ZZIP_HAVE_INTTYPES_H)
CHECK_INCLUDE_FILES(io.h ZZIP_HAVE_IO_H)
CHECK_INCLUDE_FILES(memory.h ZZIP_HAVE_MEMORY_H)
CHECK_INCLUDE_FILES(ndir.h ZZIP_HAVE_NDIR_H)
CHECK_INCLUDE_FILES(stdint.h ZZIP_HAVE_STDINT_H)
CHECK_INCLUDE_FILES(stdlib.h ZZIP_HAVE_STDLIB_H)
CHECK_FUNCTION_EXISTS(strcasecmp ZZIP_HAVE_STRCASECMP)
CHECK_INCLUDE_FILES(strings.h ZZIP_HAVE_STRINGS_H)
CHECK_INCLUDE_FILES(string.h ZZIP_HAVE_STRING_H)
CHECK_FUNCTION_EXISTS(strndup ZZIP_HAVE_STRNDUP)
CHECK_INCLUDE_FILES(sys/dir.h ZZIP_HAVE_SYS_DIR_H)
CHECK_INCLUDE_FILES(sys/int_types.h ZZIP_HAVE_SYS_INT_TYPES_H)
CHECK_INCLUDE_FILES(sys/mman.h ZZIP_HAVE_SYS_MMAN_H)
CHECK_INCLUDE_FILES(sys/ndir.h ZZIP_HAVE_SYS_NDIR_H)
CHECK_INCLUDE_FILES(sys/param.h ZZIP_HAVE_SYS_PARAM_H)
CHECK_INCLUDE_FILES(sys/stat.h ZZIP_HAVE_SYS_STAT_H)
CHECK_INCLUDE_FILES(sys/types.h ZZIP_HAVE_SYS_TYPES_H)
CHECK_INCLUDE_FILES(unistd.h ZZIP_HAVE_UNISTD_H)
CHECK_INCLUDE_FILES(winbase.h ZZIP_HAVE_WINBASE_H)
CHECK_INCLUDE_FILES(windows.h ZZIP_HAVE_WINDOWS_H)
CHECK_INCLUDE_FILES(winnt.h ZZIP_HAVE_WINNT_H)
CHECK_INCLUDE_FILES(zlib.h ZZIP_HAVE_ZLIB_H)
CHECK_INCLUDE_FILES(endian.h ZZIP_HAVE_ENDIAN_H)

CONFIGURE_FILE (
  "${CMAKE_MODULE_PATH}/config.h.in"
  "${CMAKE_SOURCE_DIR}/zzip/_config.h"
  )
  
IF (WIN32 AND CMAKE_SYSTEM_VERSION)
  SET(VER ${CMAKE_SYSTEM_VERSION})
  STRING(REPLACE "." "" ver ${VER})
  STRING(REGEX REPLACE "([0-9])" "0\\1" ver ${VER})

  MESSAGE(STATUS "_WIN32_WINNT=${VER}")

#-D_WIN32_WINNT=${VER} 
  ADD_DEFINITIONS(-DZZIP_EXPORTS)
ENDIF ()

if(MSVC)
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} /wd4100 /wd4996 /wd4244 /wd4706 /wd4702 /wd4127 /wd4701")
elseif(UNIX)
  set(CMAKE_C_COMPILER clang)
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fomit-frame-pointer -Wwrite-strings")
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wstrict-prototypes -Wpointer-arith")
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wsign-compare -Wmissing-declarations -Wdeclaration-after-statement")
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wstrict-aliasing -Warray-bounds") #-Werror-implicit-function-declaration 
endif()
