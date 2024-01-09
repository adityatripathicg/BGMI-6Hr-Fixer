@ECHO OFF
:: BatchGotAdmin
::-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"="
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
::--------------------------------------
@Echo Off
@ECHO ON
@ECHO OFF
@ECHO ON
@shift
@ECHO OFF
title 6hr Fixer

:Menu
CLS
ECHO                     ==                   1. Port block                                       ==
ECHO                     ==                   2. Unblock                                          ==
ECHO Type the number of your option and press ENTER KEY:
SET /P option=Choose option:

IF %option% EQU 1 GOTO Port_block
IF %option% EQU 2 GOTO Unblock
GOTO Menu

:Port_block
color 6
cls
REM Port block commands here...
netsh advfirewall firewall add rule name="TitanAK" dir=out protocol=TCP interface=any remoteip=any remoteport=8080-30000 action=block program="C:\Program Files\TxGameAssistant\ui\AndroidEmulatorEx.exe" enable=yes
ECHO Port block Processed Successfully!
PAUSE
goto Menu

:Unblock
color 3
cls
REM Unblock commands here...
netsh advfirewall firewall delete rule name="TitanAK"
ECHO Unblock Processed Successfully!
PAUSE
goto Menu