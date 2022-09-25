---
layout: post
title:  "Writing rubyish C# or porting ruby code to C#"
date: 2013-10-27T15:41:00+01:00
tags:  C# ruby
---

Since I liked the ruby version for parsing [phone numbers](https://github.com/sstephenson/global_phone), I ported it to C#. In order to avoid having to rewrite to much I did the following:

* To begin with, the entire project was using ruby name convention. This simplifies things.
* Whenever there is a missing method where the behavior of the method is not the same as the C# one, I added an extension method. For instance I implemented a variant of gsub. The behavior of this gsub uses $1 for matching groups (since it's more natural to remove a bit of code than make a full port).
* I tried to translate different ruby constructs into C#. For instance the lazy pattern found in the library `@variable ||= init_variable` I had to replace with `_variable ?? (_variable=InitVariable())`
* After all the tests became green and I had checked in the initial version, it was quite simple to change name convention using resharper.

The finished version is available on [github](https://github.com/wallymathieu/GlobalPhone)
