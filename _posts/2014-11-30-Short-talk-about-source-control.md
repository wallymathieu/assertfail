---
layout: post
title: Short talk about source control
date: 2014-11-30T11:30:35:+02:00
tags: source_control
---

This is a rewrite of an earlier talk about source control.

## What is source control? And why use it?

In order to track changes of your code you use source control. In the simplest setup, source control answers what your source code looked like before you accidentally broke but it looked like it was working.

In a similar sense you might want to store data about your customers in order to find it again. Who had a sale with customer A?

## Why use Sourcesafe (or CVS)?

If you are a single dev.

### Why not?
Technical answer:

* Does the single file based database accessed using file system sound scary when hosted on network share? It is! 
* Sourcesafe is not [supported](http://blogs.msdn.com/b/ukmsdn/archive/2011/01/04/end-of-support-for-visual-sourcesafe.aspx) anymore.

Less technical answer:

* Problem when working more than one person.

## Why use SVN (or similar with revision history only on server)?

The dev team are familiar with SVN and have an effective work flow in that tool.

## Why use Git (or mercurial et.c.)?

Can be an easy sourcesafe like experience if you are a single developer. If you have lots of developer, it's easier to work together using git.

When mentioning git, you cant avoid mentioning github. Git is version control. Github is hosting for that version control. Github has added some nice features as well. 

### Distributed source control?

Not connected to the corporate network at the moment? Do you work on a laptop (not connected to internet 100% of the time)? Do you like to continue browse the history and create commits? If yes, then consider using a dcvs.

### Open source and github

Many open source projects have migrated over to github since it enables easier collaboration with untrusted developers. The mechanism at work is called Pull request.

In many closed source project you pay for support and eventual bug fixes. In an open source project you pay with developer time. Sometimes you have a mixed model (you pay for fixes and support but it's open source).

### Fork!

Any public library hosted on github can be forked if you have a github account.

Why is this sweet? Most of the time the devs behind the library does not care that much about fixing stuff relevant for you. If you fork the library and fix the problem you can send a Pull request with the changes. They might be rejected. They might be ignored. If you are lucky the devs will give you hints to improve the code (this improves the code and your skills). 

## Usability of git?

The command line version of git can be a bit complicated. However, when used by a single dev you can use [Github for windows](http://windows.github.com/) in order to work in a manner similar to sourcesafe (simple gui).

A more advanced gui is the [Atlassian SourceTree](http://www.sourcetreeapp.com/).

## Hosting your code
There are several providers of git hosting. The ones I've been using are the following:

- [Github](https://github.com/)
- [TFS](http://blogs.msdn.com/b/mvpawardprogram/archive/2013/11/13/git-for-tfs-2013.aspx)
- [BitBucket](https://bitbucket.org)
- [CodePlex](https://www.codeplex.com/)
- Versioning for development code on [Dropbox](http://stackoverflow.com/questions/1960799/using-git-and-dropbox-together-effectively)?

But there are Or use one of several different open source self hosting alternatives.





