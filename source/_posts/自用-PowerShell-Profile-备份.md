---
title: 自用 PowerShell Profile 备份
categories:
  - 默认
date: 2024-02-22 20:43:23
---
<script type="text/javascript" src="/js/push.js"></script>

添加了一些常用插件、常用缩写和 rsproxy 环境变量

```
fnm env --use-on-cd | Out-String | Invoke-Expression
oh-my-posh init pwsh --config "C:\Users\dsyou\AppData\Local\Programs\oh-my-posh\themes\atomic.omp.json" | Invoke-Expression
Import-Module git-aliases -DisableNameChecking
Import-Module z
Import-Module syntax-highlighting

set-alias y yarn
function ya { yarn add $args.Trim('"') }
function yad { yarn add --dev $args.Trim('"') }
function yb { yarn build $args.Trim('"') }
function yd {
  $arguments = $args.Trim('"')
  Invoke-Expression "yarn dev $arguments"
}
function yga { yarn global add $args.Trim('"') }
function ygrm { yarn global remove $args.Trim('"') }
function yrm { yarn remove $args.Trim('"') }
function y { yarn $args.Trim('"') }

set-alias p pnpm
function pin { pnpm install }
function pa { pnpm add $args.Trim('"') }
function pad { pnpm add --save-dev $args.Trim('"') }
function pb { pnpm build $args.Trim('"') }
function pd {
  $arguments = $args.Trim('"')
  Invoke-Expression "pnpm dev $arguments"
}

set RUSTUP_DIST_SERVER="https://rsproxy.cn"
set RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"
```