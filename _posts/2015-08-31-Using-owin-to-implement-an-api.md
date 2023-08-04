---
layout: post
title: Using owin to implement an api
date: 2015-08-31T17:52:32+02:00
tags: C# owin
---

I tried implementing the same customer service xml api that I've implemented in sinatra, rails, C# webhandler, nancy etc. I was pleasantly surprised how easy it is to get it up and running. There is a story for how you write tests: [TestServer](https://msdn.microsoft.com/en-us/library/microsoft.owin.testing.testserver(v=vs.113).aspx), that you install by referencing [Microsoft.Owin.Testing](https://www.nuget.org/packages/Microsoft.Owin.Testing/).

Previous times that I've tried using Owin on mono, there has been some problems getting it to run (I think it was something related to a missing dll). Now it works fine. :)

You can find the code here: [CustomerService/Owin](https://github.com/wallymathieu/CustomerService/tree/master/owin)
