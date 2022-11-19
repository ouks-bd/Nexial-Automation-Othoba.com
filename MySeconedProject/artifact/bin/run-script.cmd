@echo off
setlocal enableextensions

REM ---------------------------------------------------------------------------
REM Nexial Automation Platform (https://nexiality.github.io/documentation/)
REM This is a starter batch file to simplify the task of automating Nexial
REM script. To use it, simply supply your script filename, like this:
REM
REM cd c:\projects\MySeconedProject\bin
REM run-script.cmd [script filename]
REM
REM ---------------------------------------------------------------------------

if "%1" == "" goto help

:set_nexial_home
	if "%NEXIAL_HOME%" == "" (set NEXIAL_HOME=C:\projects\nexial-core)
	echo setting NEXIAL_HOME    as %NEXIAL_HOME%

:set_project_home
	if "%PROJECT_HOME%" == "" (set PROJECT_HOME=C:\projects\MySeconedProject)
	echo setting PROJECT_HOME   as %PROJECT_HOME%

:set_script_name
	set CURRENT_SCRIPT=%PROJECT_HOME%\artifact\script\%1
	echo setting CURRENT_SCRIPT as %CURRENT_SCRIPT%

:run_it
    echo.
    cd /d %NEXIAL_HOME%
    cd bin
    nexial.cmd -script %CURRENT_SCRIPT%
    goto :end

:help
    echo.
    echo --------------------------------------------------
    echo ERROR: No script file specified!
    echo --------------------------------------------------
    echo Usage: %0 [script file]
    echo This batch file will exit now.
    echo.
    echo.
    pause

:end
