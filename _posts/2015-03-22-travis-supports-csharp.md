---
layout: post
title: travis supports csharp
date: 2015-03-22T20:16:19+01:00
---

I've used travis to test c# projects for a few years now. It has been a bit of a pain to get it working (read custom ppa or setting language to objective c and downloading and installing package intended for xamarin studio).

I _feel_ that good things happen because people have more confidence in mono. 

How do you test your projects on travis? Well read the [docs](http://docs.travis-ci.com/user/languages/csharp/) or look at how I have done it in [with](https://github.com/wallymathieu/with/blob/master/.travis.yml). I'm using ruby to build c# since it's multiplatform. You [can substitute](https://github.com/csainty/Veil/blob/master/Build/gruntfile.js) rake for grunt if you prefer nodejs.

Another way is to use that bash has some nice filename expansion. This means that you can probably write: 

    mono ./src/packages/NUnit.Runners.*/tools/nunit-console.exe

to avoid hard coding the version of the runner.
