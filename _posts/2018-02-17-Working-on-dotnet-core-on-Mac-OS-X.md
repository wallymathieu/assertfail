---
layout: post
title: Working on dotnet core on Mac OS X
date: 2018-02-17T13:13:55+01:00
tags: core dotnet paket
---

One thing I neglegted to mention was that there isn't really out of the box editor support for targeting both `net45` and `netstandard1.6` (or higher versions). 

My standard workaround for this have been to only target netstandard1.6 or lower for most of the relevant assemblies that I work on a day to day basis on. This works for most of the internal libraries since we deploy either `netcoreapp1.1` or `netcoreapp2.0` to Azure.

For libraries that are supposed to be [consumed by a wider set](https://github.com/gusty/FSharpPlus/blob/master/src/FSharpPlus/FSharpPlus.fsproj#L4) that has been a bit of a pain to edit on Mac OS X. 

If you try to open a .net core project that uses paket, the workaround to edit projects in Visual Studio for Mac is to [disable automatic package restore](https://developercommunity.visualstudio.com/content/problem/189500/visual-studio-for-mac-can-not-build-net-core-proje.html?childToView=191340).

The final workaround to be able to work `net45` and `netstandard1.6` dotnet core project on Mac OS X is to apply [@enricosada's fix](https://github.com/enricosada/dotnet-proj-info/blob/master/.travis.yml#L6-L8) to `.bash_profile`:

```bash
export FrameworkPathOverride=$(dirname $(which mono))/../lib/mono/4.5/
```

This has made it possible to open for instance [Giraffe](https://github.com/giraffe-fsharp/Giraffe) without doing any [other workaround](https://github.com/wallymathieu/Giraffe/tree/mono) to have it working.
