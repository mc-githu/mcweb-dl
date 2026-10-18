@echo off
chcp 65001 >nul
title 安装「小游戏启动器」证书
echo.
echo   这个证书是给「小游戏启动器.exe」「MC启动器.exe」签名的。
echo   装上之后，Windows 就不会再报"未知发布者 / 有危险"了。
echo.
echo   需要管理员权限，下面会弹 UAC，点「是」即可。
echo.
pause

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo   正在请求管理员权限...
    powershell -Command "Start-Process -Verb RunAs -FilePath '%~f0'"
    exit /b
)

echo   正在安装证书（受信任的发布者 + 受信任的根）...
certutil -addstore -f "TrustedPublisher" "%~dp0游戏启动器证书.cer"
certutil -addstore -f "Root" "%~dp0游戏启动器证书.cer"

echo.
echo   ============================================
echo    安装完成！现在再双击启动器就不会报警了。
echo   ============================================
echo.
pause
