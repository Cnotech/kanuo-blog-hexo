@echo off
title �½�POST����-Hexo
set /p name=���������±��⣺
cmd /c "hexo new %name%"
rd ".\source\_posts\%name%"
explorer ".\source\_posts\%name%.md"