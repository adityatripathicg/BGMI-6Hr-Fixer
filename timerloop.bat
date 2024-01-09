@echo off
:loop
echo Press a key:
choice /c ab /n >nul
if errorlevel 2 (
    echo You pressed 'b' - Task 2
    REM Perform Task 2
) else (
    echo You pressed 'a' - Task 1
    REM Perform Task 1
)
goto loop
