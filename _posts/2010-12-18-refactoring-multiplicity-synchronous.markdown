---
layout: post
title:  "Refactoring multiplicity, synchronous versus asynchonous"
date: 2010-12-18T13:00:00+01:00
tags: programming  C# JavaScript
---

Sometimes change hurts.

You know what I'm talking about if you need to change the multiplicity of a relationship (let's assume you talk about an ordinary sql database). For instance: From
_1 to 1_
To
_1 to many_
For instance, say it's an adress. The assumptions made when there is only one adress permeates throughout the applications. For instance a person must have bills sent to a different adress (his/her accountant or something [similar](http://sv.wikipedia.org/wiki/God_man)). However, when contacted, any mail needs to be sent to the home address. The code changes alone could be many. If there are a lot of reports based on the data (accessing the information without any layer) then these could be based on assumptions out of sync with reality. If you're unlucky that might mean that you need to manually go through all the reports in the system and look for discrepancies. If you're lucky the report will simply fail. If unlucky, it will show a random adress.

Synchronous versus asynchronous execution and parallel execution
jQuery has popularized asynchronous programming. Reactive extensions will perhaps simplify your tasks. Parallel LINQ ([PLINQ](http://msdn.microsoft.com/en-us/library/dd460688.aspx)) and the Task Parallel Library ([TPL](http://msdn.microsoft.com/en-us/library/dd460717.aspx)) might even make the tasks even simpler. But what if your program assumes execution in a consecutive maner? That the parts that you need to make parallel or asynchronous are buried deep within layers of layers ... It might be that your program design needs to be restructured.
