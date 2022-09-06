@ECHO OFF

CD /D %~dp0
CD ..

CALL "%ProgramFiles(x86)%\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat"

SET CMAKE_PREFIX_PATH=c:\prj\p2p\libtorrent-2.0.7-install
SET CMAKE=c:\prj\vcpkg\downloads\tools\cmake-3.24.0-windows\cmake-3.24.0-windows-i386\bin\cmake.exe
SET CMAKE_TOOLCHAIN_FILE_Z=C:/prj/vcpkg/scripts/buildsystems/vcpkg.cmake

CD qBittorent-lezy-422

:BEGIN

%CMAKE% -G "Ninja" -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE="%CMAKE_TOOLCHAIN_FILE_Z%" -DVCPKG_TARGET_TRIPLET="x64-windows-static" -DMSVC_RUNTIME_DYNAMIC=OFF -DWEBUI=OFF

IF %ERRORLEVEL% NEQ 0 PAUSE

%CMAKE% --build build --parallel 4

IF %ERRORLEVEL% NEQ 0 (
  PAUSE
  GOTO :BEGIN
) ELSE (
  CD /D %~dp0
  START "" %ComSpec% /C launch_qb_dev_defaultdirs.cmd
)
