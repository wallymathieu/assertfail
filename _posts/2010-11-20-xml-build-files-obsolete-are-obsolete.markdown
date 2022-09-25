---
layout: post
title:  "XML build files are obsolete"
date: 2010-11-20T17:59:00+01:00
tags: ironruby msbuild rake
---

Why using a build system like Ruby rake or some other next generation tool ([psake](https://github.com/JamesKovacs/psake) looks promising) to build your .net application or library?

A) Builds are not data.
Xml is for data. It may be that the files or configurations are stored as xml, but does your build program need to be in xlm?
B) Custom tasks are easy to write. Take a look at [albacore](http://albacorebuild.net/) for instance.
C) It is easy to manage nontrivial tasks.
D) It's readable.
Write your build in rake or something similar. Write it in msbuild. You will see that as usual there is a cost to writing it in xml: It adds cruft and that angle-bracket tax.

Or you might like the xml files for some reason:
[Jonathan Pryor: Defending XML-based Build Systems](http://www.jprl.com/Blog/archive/development/2010/Apr-26.html)
He is arguing for the use of xml-basked build files. One reason is that xml is easily parsed and can be used in custom tools.

Personally I feel that coding should be done mostly by writing code. Sure, there might be nifty code generation tools that can be used to simplify some tasks, but at the end of the day you still need to get your hands dirty and make sure that it does what it's supposed to do.
