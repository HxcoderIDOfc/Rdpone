@echo off
cls
echo RDP ACTIVE... SESSION STARTED
:loop
echo RDP active... %time%
timeout /t 300 >nul
goto loop
