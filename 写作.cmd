@echo off
title �½�POST����-Hexo
set /p name=���������±��⣺
//hexo new %name%
rd ".\source\_posts\%name%"
explorer ".\source\_posts\%name%.md"
pause