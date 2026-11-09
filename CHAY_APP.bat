@echo off
chcp 65001 >nul
title RiceGuardian - Chay app tren may ao Android

rem ===== Moi truong (tat ca nam o D:\dev) =====
set "JAVA_HOME=D:\dev\jdk17"
set "ANDROID_HOME=D:\dev\android-sdk"
set "ANDROID_SDK_ROOT=D:\dev\android-sdk"
set "ANDROID_AVD_HOME=D:\dev\avd"
set "GRADLE_USER_HOME=D:\dev\gradle"
set "PUB_CACHE=D:\dev\pub-cache"
set "PATH=D:\dev\flutter\bin;D:\dev\android-sdk\platform-tools;D:\dev\android-sdk\emulator;%PATH%"

cd /d "%~dp0"

adb start-server >nul 2>&1
adb devices | findstr /R /C:"emulator-.*device" >nul
if not errorlevel 1 goto ready

echo Dang bat may ao RiceGuardian_Pixel7 ...
start "" "D:\dev\android-sdk\emulator\emulator.exe" -avd RiceGuardian_Pixel7
echo Cho may ao khoi dong xong (khoang 1-2 phut) ...
adb wait-for-device

:waitboot
set "BOOT="
for /f "delims=" %%b in ('adb shell getprop sys.boot_completed 2^>nul') do set "BOOT=%%b"
if "%BOOT:~0,1%"=="1" goto ready
timeout /t 5 /nobreak >nul
goto waitboot

:ready
echo.
echo May ao san sang. Dang chay app ...
call flutter pub get
call flutter run -d emulator-5554

echo.
echo Da thoat. Nhan phim bat ky de dong cua so.
pause >nul
