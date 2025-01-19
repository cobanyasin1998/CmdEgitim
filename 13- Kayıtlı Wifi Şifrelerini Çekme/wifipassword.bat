@echo off
chcp 65001 > nul
color 3
echo Kayıtlı Wifi Ağları ve Şifreleri
echo --------------------

:: Kayıtlı Wifi profillerini al
for /f "tokens=2 delims=:" %%i in ('netsh wlan show profiles ^| findstr "All User Profile"') do (
    set "ssid=%%i"
    setlocal enabledelayedexpansion
    set "ssid=!ssid:~1!"
    echo SSID: !ssid!
    
    :: Wi-Fi şifresini al ve göster
    for /f "tokens=2 delims=:" %%f in ('netsh wlan show profile name^="!ssid!" key^=clear ^| findstr "Key Content"') do (
        set "password=%%f"
        set "password=!password:~1!"
        echo Şifre: !password!
    )
    endlocal
    echo ---------------------
)

pause
