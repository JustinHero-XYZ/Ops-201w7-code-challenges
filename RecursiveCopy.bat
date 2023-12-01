# Script: RecursiveCopy.bat
# Author: Justin Patterson
# Date: November 28, 2023
# Description: Windows Batch File that automates the copy operations of a user’s files using ROBOCOPY.


@echo off
set /p sourcePath="Enter the source folder path: "
set /p destinationPath="Enter the destination folder path: "

REM check if source folder exists
if not exist %sourcePath% (
  echo Error: Source folder does not exist.
  pause
  exit /b
)
REM create destination folder if it does not exist
if not exist %destinationPath% (
  mkdir %destinationPath%
  if errorlevel 1: (
    echo Error: Unable to create destination folder.
    pause
    exit /b
  )
)

REM check if ROBOCOPY was successfull.
if errorlevel 1 (
  echo Error: Copy Operation failed.
) else (
  echo Copy operation completed successfully.
)

pause
