---
layout: post
title:  "Using msysgit in cygwin"
date: 2011-10-07T11:21:00+02:00
tags: cygwin git msysgit windows
---

There are some pitfalls. One for instance is that it starts the editor wrong when running msysgit in the cygwin shell. Naturally I tried specifying different paths and ended up with the following configuration of gitconfig:

```cmd
c:\\cygwin\\home\\wallymathieu\\.gitconfig
```

```ini
[core]
  editor = "\\"/c/Program Files (x86)/Vim/vim73/gvim.exe\\""
```
