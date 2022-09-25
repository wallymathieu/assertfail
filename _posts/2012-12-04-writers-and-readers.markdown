---
layout: post
title:  "Writers and readers"
date: 2012-12-04T22:51:00+01:00
tags:
---

Reading source code is hard. One way of dealing with this is rewriting what is not understood. This can help focus on some parts of the code, but can be detrimental since it's easy to overlook functionality in files that are not touched or files that look too complex (throwing away functionality). One way of doing this is to create a fork to rewrite one, in order to be able to throw away the changes made essentially to read the code.

It's usually harder to [read code than to write it](http://gamedevwithoutacause.com/?p=1329). Trying to read a 700 line method can be to hard, thus it may need some [therapeutic refactoring](https://github.com/kytrinyx/therapeutic-refactoring) in reduce the components to pieces that can be understood.

Among several programmers, one reason why there is a tug o war between them can be because of non orthogonal and different best practices: They keep rewriting each others code because they have different ideas on what tradeoffs to prefer.