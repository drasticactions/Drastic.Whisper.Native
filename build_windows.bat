@echo off

set BUILD_TYPE=Release

@REM :windows_x64
@REM cmake -DCMAKE_BUILD_TYPE=%BUILD_TYPE% -S . -B build\win-x64 -A x64
@REM cmake --build build\win-x64 --config Release
@REM mkdir -p runtimes\win-x64
@REM copy build\win-x64\bin\Release\whisper.dll runtimes\win-x64\whisper.dll

@REM :windows_arm64
@REM cmake -DCMAKE_BUILD_TYPE=%BUILD_TYPE% -S . -B build\win-x86 -A Win32
@REM cmake --build build\win-x86 --config Release
@REM mkdir -p runtimes\win-x86
@REM copy build\win-x86\bin\Release\whisper.dll runtimes\win-x86\whisper.dll

:windows_arm64
cmake -A ARM64 -DCMAKE_SYSTEM_NAME=Windows -DCMAKE_SYSTEM_PROCESSOR=ARM64 -DCMAKE_BUILD_TYPE=%BUILD_TYPE% -S . -B build\win-arm64
cmake --build build\win-arm64 --config Release
mkdir -p runtimes\win-arm64
copy build\win-arm64\bin\Release\whisper.dll runtimes\win-arm64\whisper.dll