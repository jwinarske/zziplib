#ifndef _ZZIP__MSVC_H
#define _ZZIP__MSVC_H 1
 
/* zzip/_msvc.h. Generated automatically at end of configure. */
/* config.h.in.  Generated from configure.ac by autoheader.  */

/* whether the system defaults to 32bit off_t but can do 64bit when requested
   */
/* #undef ZZIP_LARGEFILE_SENSITIVE */

/* Define to 1 if you have the ANSI C header files. */
#ifndef ZZIP_STDC_HEADERS 
#define ZZIP_STDC_HEADERS  1 
#endif

/* Define to 1 if your processor stores words with the most significant byte
   first (like Motorola and SPARC, unlike Intel and VAX). */
/* #undef ZZIP_WORDS_BIGENDIAN */

/* Number of bits in a file offset, on hosts where this is settable. */
/* #undef ZZIP__FILE_OFFSET_BITS */

/* Define for large files, on AIX-style hosts. */
/* #undef ZZIP__LARGE_FILES */

/* Define to empty if `const' does not conform to ANSI C. */
/* #undef _zzip_const */

/* Define to `__inline__' or `__inline' if that's what the C compiler
   calls it, or to nothing if 'inline' is not supported under any name.  */
#ifndef __cplusplus
#ifndef _zzip_inline 
#define _zzip_inline  __inline 
#endif
#endif

/* Define to equivalent of C99 restrict keyword, or to nothing if this is not
   supported. Do not define if restrict is supported directly. */
#ifndef _zzip_restrict 
#define _zzip_restrict  
#endif

/* once: _ZZIP__MSVC_H */
#endif
