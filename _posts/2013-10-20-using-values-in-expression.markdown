---
layout: post
title:  "Using values in expression"
date: 2013-10-20T11:47:00+02:00
tags: C#
---

I've done some small tests while writing the library to handle [readonly objects in C#.](https://www.nuget.org/packages/With/) Turns out that getting the value of a sub expression can be costly (since you have to compile the expression and execute). When just setting one property there can be a performance benefit of using the following syntax:

> new MyClass(1, "2").With(m => m.MyProperty, 3)

There might be some way of optimizing the code in order to get better performance for the form:

> new MyClass(1, "2").With(m => m.MyProperty == 3)

If there are only a few usages then the performance hit is probably negligible.
