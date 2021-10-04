@ECHO OFF
SET INITIAL_DIR = %CD%

CD %~dp0
IF EXIST v (
    ECHO Removing V
    DEL /F/Q/S v > NUL
    RMDIR /Q/S v
)
ECHO Clonning V
git clone https://github.com/vlang/v

CD v

ECHO Building
make.bat
ECHO Adding VLS
v.exe install vls

CD %INITIAL_DIR%
ECHO Done