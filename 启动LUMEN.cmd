@echo off
chcp 65001 >nul
cd /d "%~dp0"

where python >nul 2>nul
if errorlevel 1 (
  echo 需要先安装 Python 才能启动本地预览服务器。
  echo.
  echo 请安装 Python 后再双击本文件。
  pause
  exit /b 1
)

start "" /b python -m http.server 8000 --bind 127.0.0.1
timeout /t 1 /nobreak >nul
start "" "http://127.0.0.1:8000/index.html"

echo.
echo LUMEN 已运行：http://127.0.0.1:8000/index.html
echo 使用摄像头手势控制时请保持本窗口开启。
echo 按 Ctrl+C 或关闭本窗口即可停止本地服务。
echo.
pause
