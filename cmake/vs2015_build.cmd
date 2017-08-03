
REM ################################
REM # Debug
REM ################################
mkdir build32 & pushd build32
cmake -G "Visual Studio 14 2015" .. -DBUILD_ZLIB=ON -DZLIB_FOUND=1 -DZLIB_INCLUDE_DIR="..\zlib" -DZLIB_LIBRARY="..\zlib\Debug\zlibstaticd.lib" -DCMAKE_BUILD_TYPE=Debug
popd
mkdir build64 & pushd build64
cmake -G "Visual Studio 14 2015 Win64" .. -DBUILD_ZLIB=ON -DZLIB_FOUND=1 -DZLIB_INCLUDE_DIR="..\zlib" -DZLIB_LIBRARY="..\zlib\Debug\zlibstaticd.lib" -DCMAKE_BUILD_TYPE=Debug
popd
mkdir buildarm & pushd buildarm
cmake -G "Visual Studio 14 2015 ARM" .. -DBUILD_ZLIB=ON -DZLIB_FOUND=1 -DZLIB_INCLUDE_DIR="..\zlib" -DZLIB_LIBRARY="..\zlib\Debug\zlibstaticd.lib" -DCMAKE_BUILD_TYPE=Debug
popd

cmake --build build32 --config Debug --clean-first
cmake --build build64 --config Debug --clean-first
cmake --build buildarm --config Debug --clean-first


REM ################################
REM # Release
REM ################################
REM mkdir build32 & pushd build32
REM cmake -G "Visual Studio 14 2015" .. -DBUILD_ZLIB=ON -DZLIB_FOUND=1 -DZLIB_INCLUDE_DIR="..\zlib" -DZLIB_LIBRARY="..\zlib\Release\zlibstaticd.lib" -DCMAKE_BUILD_TYPE=Release
REM popd
REM mkdir build64 & pushd build64
REM cmake -G "Visual Studio 14 2015 Win64" .. -DBUILD_ZLIB=ON -DZLIB_FOUND=1 -DZLIB_INCLUDE_DIR="..\zlib" -DZLIB_LIBRARY="..\zlib\Release\zlibstaticd.lib" -DCMAKE_BUILD_TYPE=Release
REM popd
REM mkdir buildarm & pushd buildarm
REM cmake -G "Visual Studio 14 2015 ARM" .. -DBUILD_ZLIB=ON -DZLIB_FOUND=1 -DZLIB_INCLUDE_DIR="..\zlib" -DZLIB_LIBRARY="..\zlib\Release\zlibstaticd.lib" -DCMAKE_BUILD_TYPE=Release
REM popd
REM 
REM cmake --build build32 --config Release --clean-first
REM cmake --build build64 --config Release --clean-first
REM cmake --build buildarm --config Release --clean-first
