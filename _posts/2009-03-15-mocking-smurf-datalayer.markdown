---
layout: post
title:  "Mocking smurf datalayer"
date: 2009-03-15T09:16:00+01:00
categories: c# mocking moq rhino unit-test
---

Mocking is <span class="variant">quite a new concept for me since I've mostly written unit-tests tha</span>t can be labelled "automatic test". But it looks pretty sweet to write real unit-tests where those apply. I'm more than a bit impressed by the ease of testing code written in asp.net mvc.<br><br>I had some trouble with method interception in Rhino and NUnit mock. Somehow the mocking failed for those frameworks. It was not a total dud since the mocking of properties worked. I spent a lot time yesterday trying to get it to work. Since a standard example from the web failed on my machine, I've assumed that there isn't much to do. Since Rhino looks so sweet, I will try to find out why it fails some other day.<br><br>What did work however was <a href="http://code.google.com/p/moq/">moq</a>:<br><br><span style="font-size:85%;">var Svc = new Mock<ismurfservice>();<br>Assert.IsNotNull(Svc);<br>controller.Svc = Svc.Object;<br><br>Smurf smurf1 = SmurfTestHelper.GetSmurf();<br>Svc.Expect(e =&gt; e.GetSmurf(It.IsAny<guid>())).Returns(smurf1);</guid></ismurfservice></span><br><br>As you can se from the example code I'm doing things that are a bit nasty: Exposing the datalayer SmurfService in controller in order to be able to use it in the binding.
<div style="clear: both;"></div>