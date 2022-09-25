---
layout: post
title: Should you work with old technologies?
date: 2016-08-15T07:49:37+02:00
tags: meta
---

## Why should a coder avoid old technologies?

### Large complicated systems are often written in older technologies

Newer technologies can mean assignments with fewer lines of code and more greenfield development. Since the amount of code is proportional to the amount of time and people spent working on that code. Greenfield development is easier than working with millions of lines of code. It can however be an interesting challange to [rewrite an older system](https://www.amazon.com/Working-Effectively-Legacy-Michael-Feathers/dp/0131177052).

### Market value.

In order to sell consulting services, many people will push for new tech.

Since the market value of a coder is related to experience with the current technologies in use, knowing and working with new technologies is a good policy to stay competitive. This means that even regular employees will push for new technologies.

New tech may shift how you develop. For instance JavaScript performance improvements have made it feasible to run more logic browser side, causing a drive towards writing code more like regular server side code using ko, angular, react et.c.. Virtual machines performance that is close to native performance ([JVM](https://en.wikipedia.org/wiki/Java_virtual_machine), [CLR](https://en.wikipedia.org/wiki/Common_Language_Runtime)) and the use of GC can simplify a lot of code (easier to work with) and create demand for different skills.

### Writing new libraries

Working in mature technologies can mean that the trailblazers have solved many of the problems. What's left is to try to get patches for potentially unmaintained libraries. If you are one of the trailblazers you can increase your market value by providing a library that many people use (thus people get to know your name). You will need to market the library in order to gain attract developers to write pull requests and contribute issues. Good way of marketing a library is to present it during meetups or conferences.

## Why should a coder avoid untested technologies?

### Stability

New code without tests or insufficient test coverage has a greater probability of bugs. As development of new things progress, the API's will change until they mature. The maintainers may wish to iron out quirks from the API's.

### Learning overhead

If the new technology is radically different from the old (angular vs jQuery), the amount of time spent learning impacts your ability to deliver. This cost can be sufficiently small if you know that you will have a lot of things to deliver (i.e. you know that you will spend enough time on the code). In order to avoid information overload you might want to have a mixture of known and unknown. Some developers are better at grokking new libraries and languages than others, but you still need to think about the team.

### Trailblazer moving on to greener pastures

A trailblazer might want to move on to the next language after creating a few new library. Or if the technology becomes somewhat popular (without people that want to help out) the maintainer might not have enough time on their hands to support the library. This means that some libraries might become abandoned. Talk with the original author, sometimes they can be convinced to pass on the keys to NuGet, github et.c. as long as you are willing to help maintain the lib and review pull requests.

