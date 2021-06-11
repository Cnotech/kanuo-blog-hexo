@echo off
title ����ˮӡͼ��

::��������
set INPUT_PATH=..\source\_posts\img
set OUTPUT_PATH=.\watermarked
set ALLOWED_EXT=*.jpg *.png

::���ImageMagick
where magick.exe
if %errorlevel% neq 0 (
    echo �밲װImageMagick��������ӵ�PATH
    pause
    exit
)

::���Ŀ¼
if not exist %INPUT_PATH% (
    echo ����·�������ڣ�%INPUT_PATH%
    pause
    exit
)
if not exist %OUTPUT_PATH% md %OUTPUT_PATH%
if not exist logo.png (
    echo ���ṩˮӡ�ļ�logo.png
    pause
    exit
)

dir /b /A:-D %INPUT_PATH% %ALLOWED_EXT%>tmp.txt

::��������ͼƬ
for /f  "usebackq" %%a in (tmp.txt) do (
    set "str=%%a"
    if not exist %OUTPUT_PATH%\%%a cmd /v /c magick composite -dissolve 20% -gravity southeast logo.png !INPUT_PATH!\!str! !OUTPUT_PATH!\!str!
)

del /f /q tmp.txt