---
layout: post
title:  "Always attaching debugger when starting a program in windows"
date: 2012-09-24T11:20:00+02:00
categories: debugging windows
---

So, Im using <a href="http://technet.microsoft.com/en-us/sysinternals/bb896645">Process Monitor</a> to hunt down some permission or anti virus problems in windows. I notice  a query to a registry key "Image File Execution Options". I get curious. Turns out that you can <a href="http://msdn.microsoft.com/en-us/library/windows/desktop/ff190925(v=vs.85).aspx">turn on a debugger</a> when starting a program. Someone used it to <a href="http://blogs.technet.com/b/marcelofartura/archive/2006/10/24/a-virus-infection-contolling-the-outbreak-tip.aspx">control a virus outbreak</a>, but it could be handy for other things as well.
<div style="clear: both;"></div>