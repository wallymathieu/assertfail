---
layout: post
title:  "Assert.Fail"
date: 2009-09-04T08:46:00+02:00
tags: 
---

Why Assert.Fail? Some might find it negative. Perhaps it is. The way I use it is more like a clean slate:<br><br>public void FooTest(){<br>   Assert.Fail();<br>}<br><br>It's the starting point of many tests. Same as methods:<br><br>public void Foo(){<br>   throw new NotImplementedException();<br>}<br><br>It's a clean canvas for your implementation.
<div style="clear: both;"></div>