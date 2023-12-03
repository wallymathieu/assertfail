---
layout: post
title: Lots of deliverables
date: 2015-06-06T21:31:41+02:00
tags: .net architecture
---

The use of many assemblies has an appeal from an architectural standpoint. In order to separate dependencies you want different parts of your code to be able to load even though a certain version of visual studio sdk is not installed. To have a fixed api implemented by adapter assemblies for many different versions of a hard to install library dependency is a way to allow work on code without having to install every single version of the dependency.

The problem is if you separate your code into many assemblies to early before you know the interdependencies between different subdomains. You can easily get a lot of code and extra assemblies due to subdomains that need to know much about each other. I like the reasoning in [Martin Fowlers post](http://martinfowler.com/bliki/MonolithFirst.html): That you should wait until you know more.

Sometimes, the best thing is to start with a new library or dll. Starting out a bit greenfield when you start develop something new (something of sufficient size and with sufficiently small amount of knowledge about the existing code). It's like applying the single responsibility principle on a larger scale.
