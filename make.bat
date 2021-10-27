@ECHO OFF
SET REMOTE="https://nodejs.org/dist/v17.0.1/node-v17.0.1-win-x64.zip"
SET LOCAL="node.zip"
SET DIR="node"
SET INITIAL_DIR = %CD%

CD %~dp0
IF EXIST %DIR% (
    ECHO Removing Node.js
    DEL /F/Q/S %DIR% > NUL
    RMDIR /Q/S  %DIR%
)

ECHO Downloading Node.js
POWERSHELL -Command "(New-Object Net.WebClient).DownloadFile('%REMOTE%', '%LOCAL%')"

ECHO Extracting Node.js
tar -xf %LOCAL% -m

ECHO Cleanup
DEL /F/Q/S %LOCAL% > NUL
MOVE "node*" %DIR%

CD %INITIAL_DIR%
ECHO Done