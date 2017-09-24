
REM ################################
REM # Debug
REM ################################
REM rmdir build32 /q /s
REM mkdir build32 & pushd build32
REM cmake -G"Visual Studio 15" -DCMAKE_INSTALL_PREFIX=c:\tmp\zziplib\Win32\Debug -DBUILD_ZLIB=ON -DCMAKE_BUILD_TYPE=Debug -DZZIP_ENABLE_WRITE=ON ..
REM popd
REM rmdir build64 /q /s
REM mkdir build64 & pushd build64
REM cmake -G"Visual Studio 15 Win64" -DCMAKE_INSTALL_PREFIX=c:\tmp\zziplib\Win64\Debug -DBUILD_ZLIB=ON -DCMAKE_BUILD_TYPE=Debug -DZZIP_ENABLE_WRITE=ON ..
REM popd
REM rmdir buildarm /q /s
REM mkdir buildarm & pushd buildarm
REM cmake -G"Visual Studio 15 ARM" -DCMAKE_INSTALL_PREFIX=c:\tmp\zziplib\ARM\Debug -DBUILD_ZLIB=ON -DCMAKE_BUILD_TYPE=Debug -DZZIP_ENABLE_WRITE=ON ..
REM popd

cmake --build build32 --config Debug --target install
cmake --build build64 --config Debug --target install
cmake --build buildarm --config Debug --target install


REM ################################
REM # Release
REM ################################
REM mkdir build32 & pushd build32
REM cmake -G"Visual Studio 15" -DCMAKE_INSTALL_PREFIX=c:\tmp\zziplib\Win32\Release -DBUILD_ZLIB=ON -DCMAKE_BUILD_TYPE=Release -DZZIP_ENABLE_WRITE=ON ..
REM popd
REM mkdir build64 & pushd build64
REM cmake -G"Visual Studio 15 Win64" -DCMAKE_INSTALL_PREFIX=c:\tmp\zziplib\Win64\Release -DBUILD_ZLIB=ON -DCMAKE_BUILD_TYPE=Release -DZZIP_ENABLE_WRITE=ON ..
REM popd
REM mkdir buildarm & pushd buildarm
REM cmake -G"Visual Studio 15 ARM" -DCMAKE_INSTALL_PREFIX=c:\tmp\zziplib\Win64\Release -DBUILD_ZLIB=ON -DCMAKE_BUILD_TYPE=Release -DZZIP_ENABLE_WRITE=ON ..
REM popd
REM 
REM cmake --build build32 --config Release --clean-first
REM cmake --build build64 --config Release --clean-first
REM cmake --build buildarm --config Release --clean-first
