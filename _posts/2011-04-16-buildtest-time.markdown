---
layout: post
title:  "Build/test time"
date: 2011-04-16T23:17:00+02:00
tags: visual_studio build unit-test
---

## Keep solutions simple and think about your deliverables

Chad Myers at Los Techies tries to get a discussion about why it's bad to have to many projects:
[Project anti-pattern: Many projects in a Visual Studio Solution File](http://lostechies.com/chadmyers/2008/07/16/project-anti-pattern-many-projects-in-a-visual-studio-solution-file/)
Some of the consideration is about build performance. He is referencing microsoft blog posts... I know the lure of getting to drink coffee while waiting for builds, but you're not getting paid for coffee ;)
There is an article on O'Reilly about the cost of long development cycles:
[Dead Time (...code, compile, wait, wait, wait, test, repeat)](http://www.oreillynet.com/onjava/blog/2006/03/dead_time_code_compile_wait_wa.html)

This is also reflected in the documentation on team development:
[Msdn: Team Development with Visual Studio Team Foundation Server: Chapter 3 – Structuring Projects and Solutions in Source Control](http://msdn.microsoft.com/en-us/library/bb668953.aspx)
They recommend you to keep it simple:

Keep the following considerations in mind when designing a project and solution structure:

* Each project generates an assembly at build time. Start by determining what assemblies you want to create and then use this to decide what projects you need. Use this to determine how to factor your codebase into projects.
* Start with the simplest single solution structure. Only add complexity to your structure when it is really necessary.

...

From Brad Adams msdn blog:
[Perf trade off: lots of small assemblies or fewer bigger assemblies??](http://blogs.msdn.com/b/brada/archive/2004/05/05/126934.aspx)
Puts it like this:
fewer bigger assemblies are better

But he is talking about the performance of your applications. He mentions that they optimize for bigger assemblies. This is probably why visual studio is optimized this way as well.

## Why writing unit tests and not only integration tests?

Integration tests are immensely useful. However, the amount of time you spend on running tests is part of the above mentioned coffee time. If you are writing unit tests when testing your C# code this means less time spent being bored waiting.

## About why build time is important

Note that they are even factoring in the time it takes you to run the tests. Imagine the Dead Time if you need to test manually. Not to rant, but the Dead Time ratio would be even higher. It's simple economics that by writing tests as part of your development cycle will make you more productive. 

How often do you execute a build per day? Lets say that you do it every 30 minutes ca. If your build time is 1 minute. That gives you a 31 minute cycle. Divide 8 hours by this cycle and you get: 15.5. If the build time is 5 minutes that gives you: 13.7. That means you will be 12% less effective per day.

The above mentioned number is actually misleading. An experienced developer working with well known tools may be able to work in longer cycles thus avoiding a lot of the Dead Time. However, when working in areas you are relatively inexperienced in (only worked with for a few years) you will benefit from the possibility to do explorative coding if your build/test cycle is short. Michael Feathers touches on this issue in his post about [the Urge to REPL, the Urge to test](http://michaelfeathers.typepad.com/michael_feathers_blog/2011/04/the-urge-to-repl-the-urge-to-test.html). REPL is simply read-eval-print-loop. It's why you can be very productive when you use scripting languages. You can do explorative coding and get instant feedback without waiting for builds.

The numbers also suggests that monitoring your build time, test time can lead to greater productivity. Maybe not running all of the integration tests but letting a continuous integration server let you know if any of them fails.

Another important factor is: Instant gratification. The joy of seeing the result of your action in a short amount of time.

## Also you might want to read

[Partitioning Your Code Base Through .NET Assemblies and Visual Studio Projects](http://www.simple-talk.com/dotnet/.net-framework/partitioning-your-code-base-through-.net-assemblies-and-visual-studio-projects/)

[I Don’t Have Time for Unit Tests](http://mikehadlow.blogspot.com/2011/06/i-dont-have-time-for-unit-tests.html)
