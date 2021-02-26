@echo off

title Updating(1/5)
git add *.md
git add *.cmd
git add *.js
git add *.jpg
git add *.png
git add *.txt
git add *.yml
git add *.php
git add *.html
git commit -m "%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%%time:~6,2%%time:~9,2%"
git push

title Building(2/5)
del /f /s /q public
rd /s /q public
xcopy /s stuff public\

cmd /c "hexo g"

del /f /s /q public\img
rd /s /q public\img

title Compressing(3/5)
cd public
"C:\Program Files\7-Zip\7z.exe" a -tzip dist.zip *

ssh root@192.144.230.47 "cd /www/wwwroot/www.edgeless.top;rm -rf *"
title Uploading(4/5)
scp "dist.zip" root@192.144.230.47:/www/wwwroot/www.edgeless.top
title Unziping(5/5)
ssh root@192.144.230.47 "cd /www/wwwroot/www.edgeless.top;unzip -O CP936 ./dist.zip"
title Finish
timeout 5