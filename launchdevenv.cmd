CALL "%ProgramFiles(x86)%\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat"

SET CMAKE=c:\prj\vcpkg\downloads\tools\cmake-3.24.0-windows\cmake-3.24.0-windows-i386\bin\cmake.exe
SET CMAKE_TOOLCHAIN_FILE_Z=C:/prj/vcpkg/scripts/buildsystems/vcpkg.cmake
SET CMAKE_PREFIX_PATH=c:\prj\vcpkg\installed\x64-windows-static\share

START "" "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\IDE\devenv.exe" 
