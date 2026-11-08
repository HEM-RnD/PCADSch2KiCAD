@echo off
rem Build PCADSch2KiCAD.exe with clang against the MSVC CRT.
rem usage: build.bat [output dir]   (default: <repo>\out-clang)
rem Requires Visual Studio 2022 (headers/libs) and LLVM clang.
setlocal
set "SRC=%~dp0..\.."
set "OUT=%~1"
if "%OUT%"=="" set "OUT=%SRC%\out-clang"
if "%CLANG%"=="" set "CLANG=C:\Tools\clang+llvm-18.1.8-x86_64-pc-windows-msvc\bin\clang.exe"
if "%VCVARS%"=="" set "VCVARS=C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"
call "%VCVARS%" >nul
if not exist "%OUT%" mkdir "%OUT%"
cd /d "%SRC%"
"%CLANG%" --target=x86_64-pc-windows-msvc -std=gnu11 -O2 -Wall -Wno-unused-variable -Wno-unused-but-set-variable -D_CRT_SECURE_NO_WARNINGS -D_CRT_NONSTDC_NO_DEPRECATE -include "%~dp0msvc_compat.h" -o "%OUT%\PCADSch2KiCAD.exe" KiCADOutputSchematic.c Lexic.c PCADEnums.c PCADOutputSchematic.c PCADParser.c PCADProcessSchematic.c Parser.c main.c
