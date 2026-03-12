@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  Gradle startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

@rem Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >nul 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto init

echo.
echo ERROR: JAVA_HOME is pointing to a non existent java folder: %JAVA_HOME%
echo.
echo ERROR: Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:init
@rem Get command-line arguments, handling Windowz variants

if not "%OS%" == "Windows_NT" goto win9xME_base
if "%CMDCMDLINE%" == "" goto win9xME_base

set CMD_LINE_ARGS=%*
goto execute

:win9xME_base
@rem Remainder is platform specific supporting Windows 9x and later.
if "%OS%"=="Windows_NT" (
  setlocal enabledelayedexpansion
  for /F "usebackq delims=$0D" %%A in (!CMDCMDLINE!) do set CMD_LINE_ARGS=%%A
)

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\gradle\wrapper\gradle-wrapper.jar

@rem Execute Gradle
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %GRADLE_OPTS% "-Dorg.gradle.appname=%APP_BASE_NAME%" -classpath "%CLASSPATH%" org.gradle.wrapper.GradleWrapperMain %CMD_LINE_ARGS%

:fail
rem Set variable GRADLE_OPTS before calling gradle to set JVM memory settings for example -Xmx1024m
rem java -classpath %%CLASSPATH%% -Dproperties=%%GRADLE_PROPERTIES%% org.gradle.api.tools.gradle -q doomed.tasks

goto end

:end
@endlocal

if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
if  not "" == "%ERRORLEVEL%" exit /b %ERRORLEVEL%

:mainEnd
if exist "%HOMEPATH%\.gradle\native" goto mainEnd
@endlocal
:omega
