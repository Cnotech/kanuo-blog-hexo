@echo off
title �½�EDM����-Hexo
set /p name=���������±��⣺
cmd /c "hexo new edm %name%"
rd ".\source\_posts\%name%"
explorer ".\source\_posts\%name%.md"