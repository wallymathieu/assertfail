---
layout: post
title:  "Command line option parsing"
date: 2011-10-07T07:58:00+02:00
tags:  C# cli
---

I've updated the [dotnet-console](https://github.com/wallymathieu/isop) to enable help. It's not finished, but it's looking better. Still needs a lot of refactoring though. The tests document the more stable fluent interface. The stuff behind the fluent interface is more prone to change.
It's an interesting experience to code the tests against a higher level api that is relatively stable (as an interface) and have an underlying changing implementation.
