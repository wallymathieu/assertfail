---
layout: post
title:  "When to use mocks?"
date: 2011-04-16T09:27:00+02:00
categories: unit-test
---

<div dir="ltr" style="text-align: left;" trbidi="on">
You use mocks when you want to test <a href="http://martinfowler.com/articles/mocksArentStubs.html#CouplingTestsToImplementations">how the code interacts with the mocked objekts</a>. <br><br>
If you care mostly about the end result, the final state, then it's easier and less brittle to use fakes.</div>
<div style="clear: both;"></div>