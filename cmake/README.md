
CMake Options

    1. BUILD_SHARED - Build shared libs.  OFF by default.  If set dynamic libs are generated and linked (zlib include), otherwise static libs are linked.
    2. ZZIP_CONFIGURE_INSTALL - Package Install. ON by default
    3. ZZIP_TESTS - build test subdirectory.  ON by default

    4. USE_MMAP - OFF by default
    5. LOWSTACK - OFF by default
    6. LARGEFILE_SOURCE - OFF by default
    7. ZZIP_EASY - OFF by default
    8. ZZIP_HARDEN - OFF by default
    9. ZZIP_ALLOW_MODULO_ENTRIES - OFF by default


Building on Windows
---------

Win32 zzip.sln

    cmake .. -DZZIP_CONFIGURE_INSTALL=OFF -DZLIB_LIBRARY_DIR=C:\cygwin64\home\joel\git\zlib\build\Release -DZLIB_INCLUDE_DIR=C:\cygwin64\home\joel\git\zlib

Win64 zzip.sln

    cmake .. -G"Visual Studio 15 Win64" -DZZIP_CONFIGURE_INSTALL=OFF -DZLIB_LIBRARY_DIR=C:\cygwin64\home\joel\git\zlib\build64\Release -DZLIB_INCLUDE_DIR=C:\cygwin64\home\joel\git\zlib;C:\cygwin64\home\joel\git\zlib\build64 -DBUILD_SHARED=ON
    
Note: You will need a Win64 zlib build when doing this...

Available CMake Visual Studio Generators


    Visual Studio 15 [arch]      = Generates Visual Studio 15 project files.
                                 Optional [arch] can be "Win64" or "ARM".

    Visual Studio 14 2015 [arch] = Generates Visual Studio 2015 project files.
                                 Optional [arch] can be "Win64" or "ARM".

    Visual Studio 12 2013 [arch] = Generates Visual Studio 2013 project files.
                                 Optional [arch] can be "Win64" or "ARM".

    Visual Studio 11 2012 [arch] = Generates Visual Studio 2012 project files.
                                 Optional [arch] can be "Win64" or "ARM".

    Visual Studio 10 2010 [arch] = Generates Visual Studio 2010 project files.
                                 Optional [arch] can be "Win64" or "IA64".

    Visual Studio 9 2008 [arch]  = Generates Visual Studio 2008 project files.
                                 Optional [arch] can be "Win64" or "IA64".

    Visual Studio 8 2005 [arch]  = Generates Visual Studio 2005 project files.
                                 Optional [arch] can be "Win64".
>

Mac
-----

    cmake .. -DCMAKE_INSTALL_PREFIX=/Users/joel.winarske/git/zzip/build/out -DBUILD_SHARED=ON
    make install
    make uninstall

Create XCode project

    cmake -G Xcode .. -DCMAKE_INSTALL_PREFIX=/Users/joel.winarske/git/zzip/build/out -DBUILD_SHARED=ON

Linux
-------

    cmake .. -DBUILD_SHARED=ON
    sudo make install
    sudo make uninstall

Create Eclipse project

    cmake -G"Eclipse CDT4" .. -DBUILD_SHARED=ON

Android
---------
