---
layout: post
title: Mono and OS X El Capitan
date: 2015-10-16T07:32:05+02:00
tags: mono xamarin
---

After installing OS X El Capitan on my computer I noticed that fsharp interactive failed to start because it failed to locate mono:

~~~
/Library/Frameworks/Mono.framework/Versions/4.0.4/bin/fsharpi: line 24: exec: mono: not found

Session termination detected. Press Enter to restart.
~~~

If we look at the file at that position we find that it assumes that mono is in the path. I checked /etc/paths, and it looked correct (i.e. based on the paths file, mono should have been in the path):

~~~
mathieu$ which mono
/usr/local/bin/mono
mathieu$ ls -la /usr/local/bin/mono
lrwxr-xr-x  1 mathieu  admin  48 Sep 12 21:56 /usr/local/bin/mono -> /Library/Frameworks/Mono.framework/Commands/mono
~~~

I've found that there is a [stackoverflow answer](http://stackoverflow.com/questions/32806615/xamarins-f-interactive-pad-cannot-find-mono). I opted for a somewhat different approach and created a file in my ~/bin folder with essentially the same fix (this was before the stackoverflow answer, so it's not exactly alike). You can find it [here](https://gist.github.com/wallymathieu/99d20a5090f9691e38e0).

After that I changed the xamarin studio f# interactive settings so that the path is ~~~/Users/mathieu/bin/fsharpi~~~.

I'm thinking that later on I want to change the settings for fsharpi and fsharp to point to a local nuget repository (containg a paket.dependencies file) with [FSharp.Compiler.Tools](https://www.nuget.org/packages/FSharp.Compiler.Tools) installed.
