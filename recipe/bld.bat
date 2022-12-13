@echo ON
setlocal enabledelayedexpansion

copy %RECIPE_DIR%\CMakeLists.txt CMakeLists.txt
if errorlevel 1 exit 1

mkdir build
cd build

cmake %CMAKE_ARGS% ..
if errorlevel 1 exit 1
cmake --build . --config Release
if errorlevel 1 exit 1

if not exist "%PREFIX%\Library\bin" mkdir "%PREFIX%\Library\bin"
if errorlevel 1 exit 1

copy Release\rcedit.exe %PREFIX%\Library\bin\rcedit.exe
if errorlevel 1 exit 1
