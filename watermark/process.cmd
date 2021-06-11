@echo off
title 生成水印图像

::常量配置
set INPUT_PATH=..\source\_posts\img
set OUTPUT_PATH=.\watermarked
set ALLOWED_EXT=*.jpg *.png

::检查ImageMagick
where magick.exe
if %errorlevel% neq 0 (
    echo 请安装ImageMagick并将其添加到PATH
    pause
    exit
)

::检查目录
if not exist %INPUT_PATH% (
    echo 输入路径不存在：%INPUT_PATH%
    pause
    exit
)
if not exist %OUTPUT_PATH% md %OUTPUT_PATH%
if not exist logo.png (
    echo 请提供水印文件logo.png
    pause
    exit
)

dir /b /A:-D %INPUT_PATH% %ALLOWED_EXT%>tmp.txt

::处理现有图片
for /f  "usebackq" %%a in (tmp.txt) do (
    set "str=%%a"
    if not exist %OUTPUT_PATH%\%%a cmd /v /c magick composite -dissolve 20% -gravity southeast logo.png !INPUT_PATH!\!str! !OUTPUT_PATH!\!str!
)

del /f /q tmp.txt