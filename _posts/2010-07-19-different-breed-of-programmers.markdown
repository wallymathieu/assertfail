---
layout: post
title:  "Different breed of programmers"
date: 2010-07-19T21:46:00+02:00
tags: programming C# lint unit-test
---

After talking to a few of my colleges I'm thinking of the different kind of programmers needed for different projects, for different aspects of projects.

Duct tape programmer:
[http://www.joelonsoftware.com/items/2009/09/23.html](http://www.joelonsoftware.com/items/2009/09/23.html)
Writing code that ships. Does not necessarily need to look clean. Will probably not write any unit-tests. No fancy abstractions, no patterns or anything.

Maintenance programmer:
[http://www.codinghorror.com/blog/2006/06/the-noble-art-of-maintenance-programming.html](http://www.codinghorror.com/blog/2006/06/the-noble-art-of-maintenance-programming.html%20)
Have had every sort of wrench imaginable thrown right in the face. This guy will be very skeptic of dirty code. It's about pragmatic programming and excelling at making sure that old stuff works.

The thing is: Different type of programmers are good for different things in a project. A maintenance programmer (or a programmer in that mode) will not necessarily be any good at writing new applications FAST (like really, really fast). Maybe the sales force needs something done within a week or a few days. Then you're looking for a duct tape programmer. But don't kid yourself. Finding people good at this kind of skills is hard. Problem is, you might loose time by pressuring the other programmers into writing code fast. People might think that they are duct tape programmers. But seriously, few of us are.

Duct tape programming, the term that comes to mind is Quick & Dirty
As a coworker said:
\- When you do it quick and dirty you have actually taken a loan. If you take additional loans to do small fixes, sooner or later any change will take horrendous **time**.

Where do I stand in this mix? Maybe I'm a mix of a few of these. Frankly I'm not very good at duct tape programming. I try to mix maintenance and duct taping. Doing integration testing and unit testing in order to make sure that the server bits are done until the time that I start coding the GUI. Making sure that the GUI interacts with a decent API instead of doing the logic directly will make it easier if you have a lot of complicated server logic. The pro of this approach is that you do not need to be a pro at the tool you're using. As the requirements change, you will still have something that works.
