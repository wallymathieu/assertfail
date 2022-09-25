---
layout: post
title:  "Always attaching debugger when starting a program in windows"
date: 2012-09-24T11:20:00+02:00
tags: debugging windows
---

So, Im using [Process Monitor](http://technet.microsoft.com/en-us/sysinternals/bb896645) to hunt down some permission or anti virus problems in windows. I notice  a query to a registry key "Image File Execution Options". I get curious. Turns out that you can [turn on a debugger](http://msdn.microsoft.com/en-us/library/windows/desktop/ff190925(v=vs.85).aspx) when starting a program. Someone used it to [control a virus outbreak](http://blogs.technet.com/b/marcelofartura/archive/2006/10/24/a-virus-infection-contolling-the-outbreak-tip.aspx), but it could be handy for other things as well.
