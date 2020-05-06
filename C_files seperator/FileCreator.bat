@echo off
SETLOCAL EnableDelayedExpansion
if [%1]==[] GOTO WRONGINPUT
if [%2]==[] GOTO WRONGINPUT
if [%3]==[] GOTO WRONGINPUT
if [%4]==[] GOTO WRONGINPUT
set folder_name=%1
set file_text=%2
set file_source=%3
set file_header=%4
IF NOT EXIST "Text Files" ( MKDIR "Text Files" )
IF NOT EXIST "Source Files" ( MKDIR "Source Files" )
IF NOT EXIST "Header Files" ( MKDIR "Header Files" )
IF NOT EXIST %folder_name% ( MKDIR %folder_name% )
cd %folder_name%
IF NOT EXIST %file_text% ( set counter=0 )
for /F "tokens=1 delims= " %%i in (%file_text%) do (
set  counter=%%i
)
set  /a counter=!counter!+1
echo !counter!>%file_text%
echo !counter!>%file_source%
echo !counter!>%file_header%
cd..
copy /Y %folder_name%\*.txt "Text Files"
copy /Y %folder_name%\*.c "Source Files"
copy /Y %folder_name%\*.h "Header Files"
goto END
:WRONGINPUT
echo Please try again later
:END