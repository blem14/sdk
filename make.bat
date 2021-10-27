@ECHO OFF
SET REMOTE="https://www.python.org/ftp/python/3.10.0/Python-3.10.0.tgz"
SET LOCAL="python.tgz"
SET DIR="python"
SET INITIAL_DIR = %CD%

CD %~dp0
IF EXIST %DIR% (
    ECHO Removing Python
    DEL /F/Q/S %DIR% > NUL
    RMDIR /Q/S  %DIR%
)

ECHO Downloading Python
POWERSHELL -Command "(New-Object Net.WebClient).DownloadFile('%REMOTE%', '%LOCAL%')"

ECHO Extracting Python
tar -xf %LOCAL% -m

ECHO Cleanup
DEL /F/Q/S %LOCAL% > NUL
MOVE "python*" %DIR%

CD %INITIAL_DIR%
ECHO Done