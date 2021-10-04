@ECHO OFF
SET REMOTE="https://golang.org/dl/go1.17.1.windows-386.zip"
SET LOCAL="go.zip"
SET DIR="go"
SET INITIAL_DIR = %CD%

CD %~dp0
IF EXIST %DIR% (
    ECHO Removing Go
    DEL /F/Q/S %DIR% > NUL
    RMDIR /Q/S  %DIR%
)

ECHO Downloading Go
POWERSHELL -Command "(New-Object Net.WebClient).DownloadFile('%REMOTE%', '%LOCAL%')"

ECHO Extracting Go
tar -xf %LOCAL% -m

ECHO Cleanup
DEL /F/Q/S %LOCAL% > NUL

CD %INITIAL_DIR%
ECHO Done