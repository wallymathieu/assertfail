---
layout: post
title:  "Running Rake under cygwin"
date: 2011-09-01T15:14:00+02:00
tags: cygwin rake
---

I had some problems with running rake under cygwin. I get the following error while trying to execute rake:<br><span class="Apple-style-span" style="background-color: black; color: white;">C:\Ruby192\bin\ruby.exe: No such file or directory -- /cygdrive/c/Ruby192/bin/rake (LoadError)</span><br><br>
Could it be that the problem is that the first line in rake:<br><span class="Apple-style-span" style="background-color: black; color: white;">#!/usr/bin/env ruby </span><br>
Will return C:\Ruby192\bin\ruby.exe<br><br>
By being more explicit about what to run you can avoid the problem:<br><span class="Apple-style-span" style="background-color: black; color: white;">rake.bat</span>
<div style="clear: both;"></div>