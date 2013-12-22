---
layout: post
title:  "Using msysgit in cygwin"
date: 2011-10-07T11:21:00+02:00
categories: cygwin git msysgit windows
---

There are some pitfalls. One for instance is that it starts the editor wrong when running msysgit in the cygwin shell. Naturally I tried specifying different paths and ended up with the following configuration of gitconfig:<br><span class="Apple-style-span" style="background-color: black; color: white; font-family: 'Courier New', Courier, monospace;">c:\cygwin\home\wallymathieu\.gitconfig</span><br><br><span class="Apple-style-span" style="font-family: 'Courier New', Courier, monospace;">[core]</span><br><span class="Apple-style-span" style="font-family: 'Courier New', Courier, monospace;">  editor = "\"/c/Program Files (x86)/Vim/vim73/gvim.exe\""</span><br><br><div style="clear: both;"></div>