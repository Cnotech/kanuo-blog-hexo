---
title: 把PowerShell变成zsh
categories:
  - PowerShell
date: 2023-09-26 20:24:18
---
<script type="text/javascript" src="/js/push.js"></script>

# 前言
在 macos 下用顺手 zsh 之后就再也回不去了，回到家经常会在 PowerShell 里面习惯性的敲 `yd`。本来打算把 zsh 装 Windows 上，但是有点麻烦，因此花了点时间研究了一下如何在 PowerShell 上面复刻部分 zsh 的体验。

可以结合[PowerShell美化](/PowerShell美化)一起食用。

# 特性
这里主要迁移我比较常用的几个特性，基本上都是基于 [Oh My Zsh](https://ohmyz.sh/) 的。

## Git 缩写插件
[zsh 版](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git)

找到了一个复刻大部分原版插件功能的 PowerShell 版本模块：https://github.com/gluons/powershell-git-aliases ，按照里面的教程安装即可：
1. 直接在 PowerShell 中使用 `Install-Module git-aliases -Scope CurrentUser -AllowClobber` 安装；如果你有 scoop 也可以在添加 `extras` 桶后使用 `scoop install git-aliases`安装；
2. 使用 `notepad $profile` 打开 PowerShell 配置文件，添加 `Import-Module git-aliases -DisableNameChecking`。

## yarn 缩写
[zsh 版](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/yarn)

yarn 缩写命令应该是我用的最高频的特性了，也是最导致不习惯的一大痛点。这里没找到对应的 PowerShell 模块，因此就手动实现了一些：

1. 使用 `notepad $profile` 打开 PowerShell 配置文件，添加如下命令及函数定义：
  ```powershell
  set-alias y yarn
  function ya { yarn add $args }
  function yad { yarn add --dev $args }
  function yb { yarn build $args }
  function yd { yarn dev $args }
  function yga { yarn global add $args }
  function ygrm { yarn global remove $args }
  function yrm { yarn remove $args }
  function y { yarn $args }
  ```

没有实现全部的缩写规则，理论上是可以写一个转换规则把 [zsh 插件源码](https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/yarn/yarn.plugin.zsh)里面的全部转成 PowerShell 函数并封装成模块的，懒的搞😧。

## `z` 命令
[zsh 版](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/z)

z 命令可以通过路径关键词快速跳转到曾经导航过的目录。例如对于路径 `D:\Desktop\Projects\EdgelessPE\ept`，只要你曾经在安装 `z` 命令之后 `cd` 进过这个目录，那么之后在任意目录内都可以通过 `z ept` 快速跳转回这个路径，免去手动 `cd` 的痛苦。

这个命令有对应的 PowerShell 模块实现：https://github.com/badmotorfinger/z ，按照里面的教程安装即可：

1. 执行 `Install-Module z -AllowClobber`；
2. 使用 `notepad $profile` 打开 PowerShell 配置文件，添加 `Import-Module z` （PS：实测似乎不加也行？但是 README 里面是要求加的）。

## 语法高亮
[zsh 版](https://github.com/zsh-users/zsh-syntax-highlighting)

语法高亮可以帮助你在输入命令的同时检查输入是否正确，正确的内容会以绿色显示，错误的内容会以红色显示。

找到了一个 PowerShell 的语法高亮实现：https://github.com/digitalguy99/pwsh-syntax-highlighting ，但是用起来有点小问题，有时候没法即时显示输入是否正确，没有 zsh 上面的体验丝滑：
1. **以管理员身份启动** PowerShell，执行 `Install-Module syntax-highlighting`；
2. 使用 `notepad $profile` 打开 PowerShell 配置文件，添加 `Import-Module syntax-highlighting`。

## （AD）rsproxy
[RsProxy](https://rsproxy.cn/) 是字节跳动基础架构团队搭建的公共 rustup & crates.io 镜像，能够有效解决部分地区访问 Rust 镜像源速度慢的问题：
1. 使用 `notepad $profile` 打开 PowerShell 配置文件，添加以下命令：
  ```powershell
  Set-Variable RUSTUP_DIST_SERVER="https://rsproxy.cn"
  Set-Variable RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"
  ```
2. 其他步骤同官网