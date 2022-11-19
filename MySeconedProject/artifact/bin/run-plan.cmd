@echo off

setlocal enableextensions

REM ---------------------------------------------------------------------------
REM Nexial Automation Platform (https://nexiality.github.io/documentation/)
REM This is a starter batch file to simplify the task of automating Nexial
REM script. To use it, simply supply your plan filename, like this:
REM
REM cd c:\projects\MySeconedProject\bin
REM run-plan.cmd [plan filename]
REM
REM ---------------------------------------------------------------------------

if "%1" == "" goto help

:set_nexial_home
	if "%NEXIAL_HOME%" == "" (set NEXIAL_HOME=C:\projects\nexial-core)
	echo setting NEXIAL_HOME    as %NEXIAL_HOME%

:set_project_home
	if "%PROJECT_HOME%" == "" (set PROJECT_HOME=C:\projects\MySeconedProject)
	echo setting PROJECT_HOME   as %PROJECT_HOME%

:set_plan_name
	set CURRENT_PLAN=%PROJECT_HOME%\artifact\plan\%1
	echo setting CURRENT_PLAN   as %CURRENT_PLAN%

:run_it
    echo.
    cd /d %NEXIAL_HOME%
    cd bin
    nexial.cmd -plan %CURRENT_PLAN%
    goto :end

:help
    echo.
    echo --------------------------------------------------
    echo ERROR: No plan file specified!
    echo --------------------------------------------------
    echo Usage: %0 [plan file]
    echo This batch file will exit now.
    echo.
    echo.
    pause

:end
