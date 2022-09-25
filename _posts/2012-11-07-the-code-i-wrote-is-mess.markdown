---
layout: post
title:  "The code I wrote is a mess"
date: 2012-11-07T00:14:00+01:00
tags:
---

Many times when you return to code that you have written you will swear and be annoyed with your lack of foresight.

We have been using a library since a while back. There is a definite strength to having a simple way of exposing actions from a console application. The code for the library and runner [Isop](https://github.com/wallymathieu/isop) is a mess. A mess designed to avoid having to code a messy console application in order to do quick interactions with your code (.net code to be specific). The focus of the lib has always been to cater to the needs of business applications. I've not spent time cleaning up the code since it satisfies the criteria: If it works, why fix it?

It annoys me that I don't have the time and energy to write beautiful code. This instinct is both healthy and dangerous. It helps you create maintainable applications, but it can also get you mired down into polishing. Ultimately it goes down to the fact that different structure caters to different intent and intent often changes (thus the unpleasant hindsight). Sometimes it's that you had something simple to begin with, but as you fill in the gaps it becomes complicated.

What I'm trying to say is that it's really hard to avoid the problem of complicated code or code that does not fit your intent. What you need is to refactor. This is the skill to use.
