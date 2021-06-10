@echo off
title 新建EDM文章-Hexo
set /p name=请输入文章标题：
cmd /c "hexo new edm %name%"
rd ".\source\_posts\%name%"
explorer ".\source\_posts\%name%.md"