---
layout: post
title: Working on dotnet core on Mac OS X part 2
date: 2018-09-05T20:48:47+02:00
tags: core dotnet
---

After writing the [previous post](https://assertfail.gewalli.se/2018/02/17/Working-on-dotnet-core-on-Mac-OS-X.html) about getting some of the infrastructure working for non Windows, I've seen better ways of getting it to work. In particular we have seen the use of [netfx.props](https://github.com/fsprojects/FSharp.TypeProviders.SDK/blob/master/netfx.props) as seen in [FSharp.TypeProviders.SDK](https://github.com/fsprojects/FSharp.TypeProviders.SDK). Then you add the following to your csproj or fsproj file:
```XML
<Project Sdk="Microsoft.NET.Sdk">
  <Import Project="..\netfx.props" />
```
as can be seen in [FSharp.TypeProviders.SDK.fsproj](https://github.com/fsprojects/FSharp.TypeProviders.SDK/blob/master/src/FSharp.TypeProviders.SDK.fsproj).
