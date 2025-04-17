@echo off
del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk" >nul 2>&1
net config server /srvcomment:"Windows Server 2022 RDP via Tailscale" >nul 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F >nul 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /f /v Wallpaper /t REG_SZ /d D:\a\wallpaper.bat

net user administrator W2016 /add >nul
net localgroup administrators administrator /add >nul
net user administrator /active:yes >nul
net user installer /delete

diskperf -Y >nul
sc config Audiosrv start= auto >nul
sc start audiosrv >nul

ICACLS C:\Windows\Temp /grant administrator:F >nul
ICACLS C:\Windows\installer /grant administrator:F >nul

echo.
echo ======================================================
echo SUCCESS! Tailscale RDP session initialized!
echo Access via Tailscale IP (check GitHub workflow log)
echo ------------------------------------------------------
echo Username: administrator
echo Password: Perbatasan13#
echo ------------------------------------------------------
echo Note: Make sure your device is connected to Tailscale.
echo ======================================================
ping -n 10 127.0.0.1 >nul
