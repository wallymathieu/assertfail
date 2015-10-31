---
layout: post
title: webforms and confusion
date: 2015-10-30T12:41:16+01:00
tags: webforms c# asp.net javascript
---
## webforms and 3000 lines of codebehind

I've noticed that the common failures while using asp.net webforms is related to people getting confused about the asp.net page and control life cycle. Since there are so many different events to keep in mind, it's easy to place code in the wrong place and get something that sort of works (but does not work in all cases). If you are stressed, you might add a small if statement to fix this problem in the special case, increasing complexity in the code behind file. This then turns into 1000-3000 lines of hard to read c#. I've found that building small user controls that are built according to how you should build user controls, can help you avoid this mess (the technical lead at Macom when I worked there pushed for this). This requires you to learn how to write user controls though.

I get the feeling that it's not unusual for developers have a hard time understanding how to interact with different components written in different files. Maybe this is why junior developers using this type of code can create a hard to change architecture: large files with a lot of interconnected logic inside each file. 

## mvc and javascript

Writing asp.net mvc is conceptually easier (there are fewer things to learn, since the focus is different). However, if you want the same functionality you might have to add some javascript in order to get an app (as you get in asp.net). I have found that most developers get confused when reading and writing javascript (unless they have enough experience using it). This confusion can be mitigated by using a subset of javascript or a transpiler (problem is that you need someone in the team that knows javascript in order to be able to make informed decisions about it). In some cases you might write more javascript in order to reduce the overall complexity.

## javascript maturity

I find that the difference between c# and java is relatively minor right now. The main feature I missed in java has been lambdas (or lambda like syntax). Ruby, python and php all are similar in the sense that they have sort a class concept and that you can inherit from other classes. There is something like "this", so that you can access the object. In javascript however, "this" does not mean the current object (it can be, but it's not always the case). However, since most serverside developers are forced to learn javascript in order to complete most assignemnts, I would imagine that many developers know javascript and one of the other languages that are more similar.

We see many concepts that have been promoted serverside entering clientside applications as well. When working with a larger javascript codebase then the problems that you face will be familiar to working with a large serverside codebase.

## conclusion

What could the conclusion be from this? If we see es6 with classes and modules and the adoption of frameworks that work with objects that use this their functions to access the object itself, then programming javascript compared to server side will feel less different. Some of the javascript frameworks out there require you to learn many things (and are then compared to webforms). My feeling is that it's probably better to avoid larger frameworks like angular and extjs (unless you and your team is prepared to learn a lot of things). It's better to use well known small and stable libraries (I've heard the same opinion being voiced by others so this is nothing new).

