---
layout: post
title: Common csproj issues that can be detected automatically
date: 2016-10-04T07:02:37+02:00
tags: albacore c#
---

# Possible thing to add to Albacore

There is [currently](https://github.com/Albacore/albacore/wiki/csprojfiles) a way to detect discrepancies of the csproj view of what is supposed to be compiled.

## Stale or wrong library references
 
Sometimes we find that there is a reference to an old version of a library in one of the projects of a solution (someone discovers this when they build from scratch without old versions in packages folder). Another way to discover this is when we get an assembly load exception due to an unexpected version of an assembly. Another way for things go wrong is to have a reference to an installed version (when you want a nuget version), I've seen this happen for nunit and Newtonsoft.Json. When you try to install the it using nuget, then it can report success while only adding a packages.config line (this should be reported as a bug if it's not reported already).

This is probably fixed, but I'll mention it in order to give a reason for some discrepancies. It was not unusual that automatically adding an assembly reference with resharper would cause it to reference a binary referenced by some other project (i.e. a nuget package). This would work fine until you decide to upgrade the version (since resharper didn't add a nuget reference as well).

In some cases I've seen references to binaries in /bin/Debug. This is not that common though.

