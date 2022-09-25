---
layout: post
title:  "When to use mocks?"
date: 2011-04-16T09:27:00+02:00
tags: unit-test
---

You use mocks when you want to test [how the code interacts with the mocked objekts](http://martinfowler.com/articles/mocksArentStubs.html#CouplingTestsToImplementations).

If you care mostly about the end result, the final state, then it's easier and less brittle to use fakes.
