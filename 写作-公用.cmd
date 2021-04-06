@echo off
title 新建POST文章-Hexo
set /p name=请输入文章标题：
cmd /c "hexo new %name%"
rd ".\source\_posts\%name%"
explorer ".\source\_posts\%name%.md"