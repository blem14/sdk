@ECHO OFF
SET REMOTE="https://github.com/brechtsanders/winlibs_mingw/releases/download/11.2.0-13.0.0-9.0.0-ucrt-r2/winlibs-x86_64-posix-seh-gcc-11.2.0-llvm-13.0.0-mingw-w64ucrt-9.0.0-r2.zip"
SET LOCAL="mingw64.zip"
SET DIR="mingw64"
SET INITIAL_DIR = %CD%

CD %~dp0
IF EXIST %DIR% (
    ECHO Removing GCC
    DEL /F/Q/S %DIR% > NUL
    RMDIR /Q/S  %DIR%
)

ECHO Downloading GCC
POWERSHELL -Command "(New-Object Net.WebClient).DownloadFile('%REMOTE%', '%LOCAL%')"

ECHO Extracting GCC
tar -xf %LOCAL% -m

ECHO Cleanup
DEL /F/Q/S %LOCAL% > NUL

CD %INITIAL_DIR%
ECHO Done