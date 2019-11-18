---
layout: post
title:  "Writing build scripts in c#"
date: 2013-10-13T08:42:00+02:00
tags: c# msbuild
---

I went to [leetspeak](http://leetspeak.se/) yesterday. [Justin Rusbatch](https://github.com/jrusbatch) had a talk about scriptcs. In that talk he mentioned that several people wanted to write build scripts in c# and thought that it would be nice to use scriptcs to do that. I started trying out to write build scripts in c#. Turns out that many of the classes that are available in .net are not supposed to be used by users of .net. It's cleaner and simpler to execute the command line tools from c#. I started writing some code to try it out. I called it [shake](https://github.com/wallymathieu/shake).
