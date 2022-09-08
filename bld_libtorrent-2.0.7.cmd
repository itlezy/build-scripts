CALL "%ProgramFiles(x86)%\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat"

SET CMAKE=c:\prj\vcpkg\downloads\tools\cmake-3.24.0-windows\cmake-3.24.0-windows-i386\bin\cmake.exe
SET CMAKE_TOOLCHAIN_FILE_Z=c:\prj\vcpkg\scripts\buildsystems\vcpkg.cmake
SET CMAKE_PREFIX_PATH=c:\prj\vcpkg\installed\x64-windows-static\share

CD /D %~dp0
CD ..

MD libtorrent-2.0.7-install
CD libtorrent-2.0.7

:BEGIN

%CMAKE% -G "Ninja" -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE="%CMAKE_TOOLCHAIN_FILE_Z%" -DVCPKG_TARGET_TRIPLET="x64-windows-static" -DBUILD_SHARED_LIBS=OFF -Dstatic_runtime=ON -Ddeprecated-functions=ON -Dbuild_examples=ON -Dbuild_tools=ON -Dpython-bindings=OFF
%CMAKE% --build   build --parallel 4
%CMAKE% --install build --prefix c:\prj\p2p\libtorrent-2.0.7-install

PAUSE
