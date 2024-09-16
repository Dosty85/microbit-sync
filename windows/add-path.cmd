@echo off
setlocal

REM Get the current folder
set "currentDir=%~dp0aaa"

REM Add the path to the PATH variable only if it's not already present
echo %PATH% | findstr /I "%currentDir%" >nul
if not %errorlevel%==0 (
    REM Add the path to the system PATH variable
    setx PATH "%PATH%;%currentDir%" /M
    echo The path has been successfully added to PATH.
) else (
    echo The path already exists in PATH.
)

endlocal
