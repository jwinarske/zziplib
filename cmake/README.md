
CMake Options
-------------

    OPTION (BUILD_SHARED "Build shared libs" ON)
    OPTION (BUILD_ONLY_LIBS "Only build libraries" OFF)
    OPTION (BUILD_TESTS "Enable building tests" ON)
    OPTION (BUILD_ZLIB "Enable building zlib" OFF)
    OPTION (ZZIP_CONFIGURE_INSTALL "Install Package" ON)
    OPTION (USE_MMAP "Use memmap" OFF)
    OPTION (LOWSTACK "" OFF)
    OPTION (LARGEFILE_SOURCE "" OFF)
    OPTION (ZZIP_EASY "" OFF)
    OPTION (ZZIP_HARDEN "" OFF)
    OPTION (ZZIP_ALLOW_MODULO_ENTRIES "" OFF)
    OPTION (ZZIP_ENABLE_WRITE "Enable writing..." OFF)
    OPTION (ZLIB_AMD64 "Enable AMD64 assembler optimizations" OFF)
    OPTION (ZLIB_ASM686 "Enable 686 assembler optimizations" OFF)
    

To override the default option value, use the "-DBUILD_ONLY_LIBS=ON" scheme.  One you set it, CMake caches the value; to reset 

Building on Windows
-------------------

Win32 (zzip.sln)

    mkdir win32
	cd win32
	cmake .. -G"Visual Studio 15" -DCMAKE_INSTALL_PREFIX=c:\tmp\zziplib\Win32\Debug -DBUILD_ZLIB=ON -DCMAKE_BUILD_TYPE=Debug -DZZIP_ENABLE_WRITE=ON
	cd ..
	cmake --build win32 --config Debug

Win64 (zzip.sln)

    mkdir win64
	cd win64
    cmake .. -G"Visual Studio 15 Win64" -DCMAKE_INSTALL_PREFIX=c:\tmp\zziplib\Win64\Debug -DBUILD_ZLIB=ON -DCMAKE_BUILD_TYPE=Debug -DZZIP_ENABLE_WRITE=ON
	cd ..
	cmake --build win64 --config Debug
    
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

Cygwin
---------

    cmake .. -G"Unix Makefiles" -DBUILD_SHARED=ON -DCMAKE_INSTALL_PREFIX=/home/joel/git/zziplib/buildcyg
