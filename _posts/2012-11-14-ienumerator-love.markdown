---
layout: post
title:  "IEnumerator love"
date: 2012-11-14T11:10:00+01:00
categories: c#
---

Some times you encounter a class that implements IEnumerator without any IEnumerable implementation. To preserve the spirit of the enumerator (basically a cursor) we can just add an extension method that <a href="https://gist.github.com/4071315">yields the elements</a>.<br><br>
But most of the time it's simply to add a ".Cast<t>()" if it is IEnumerable without the extra type information.</t><div style="clear: both;"></div>