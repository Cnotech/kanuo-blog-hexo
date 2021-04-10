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
git add -f node_modules/hexo-asset-image/index.js
git commit -m "%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%%time:~6,2%%time:~9,2%"
git push

title Building(2/5)
