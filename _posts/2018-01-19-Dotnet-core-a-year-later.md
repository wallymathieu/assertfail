---
layout: post
title: Dotnet core a year later
date: 2018-01-19T21:21:06+01:00
tags: asp.net core mvc dotnet
---

We asked the other developers in December 2016 what they wanted to work on. They said that they wanted to work on [dotnet core](https://github.com/dotnet/core/blob/master/release-notes/1.0/1.0.0.md) and [MVC](https://github.com/aspnet/Mvc). I was a bit hesitant at first since that would imply using something relatively new to base the business on. [A cowoker](https://github.com/tfsjohan) at the time did inject that he was using it in production already.

It has been an interesting journey. From json + xproj to a new csproj format. The nice thing about the new format is that it includes packages in the csproj. The file format has been cleaned up (so that we no longer need to use [albacore](http://assertfail.gewalli.se/2016/10/04/Common-csproj-issues-that-can-be-detected-automatically.html)). Using NuGet is less painful compared to previously (I feel less of a need for [paket](fsprojects.github.io/Paket/) but NuGet still have catching up to do). Though, there is still a bit of weirdness that make it difficult for people. I'm helping a dev get into asp.net Mvc 2. Due to lots of different blogs about asp.net Mvc, asp.net Mvc Core 1, asp.net Mvc Core 2. This is similar to what we see on for instance differences between different minor versions of Angular. As the documentation for Mvc on microsoft sites is quite good, it becomes less of an issue than for NG.

We have used [EF Core 1-2](https://docs.microsoft.com/en-us/ef/core/). I've previously used [NHibernate](http://nhibernate.info/). EF does not perform as well as NHibernate but is easier to start out with. I wish we had used [Dapper](https://github.com/StackExchange/Dapper) since it's easier to get performant and having to write SQL discourages the use of more complicated schemas. EF migrations doesn't feel as elegant as some of the other [migration frameworks](https://github.com/fluentmigrator/fluentmigrator), it does however work well enough due to the fact that it can be used on the command line.

What has worked well has been to use [Swashbuckle.AspNetCore](https://github.com/domaindrivendev/Swashbuckle.AspNetCore). It helps with keeping documentation in sync and cuts down on the need for hand written API cruft. 

A lot of the API's have been improved in asp.net core. Default dependency injection and logging abstraction, et.c. has made the c# code more pleasant to work with. That the configuration is using dependency injection instead of global values makes it easier to reason about configuration. 
