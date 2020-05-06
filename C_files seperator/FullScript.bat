@echo off
if [%1]==[] GOTO WRONGINPUT
set input_file=%1
for /F "tokens=1-4 delims= " %%i in (%input_file%) do (
CALL FileCreator.bat %%i %%j %%k %%l
)
goto END
:WRONGINPUT
echo Please enter an input file name
:END