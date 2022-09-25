---
layout: post
title:  "using underscore filter in IE 7 & 8"
date: 2011-11-09T21:00:00+01:00
tags: ie7 ie8 underscore
---

Array.prototype.filter seems to be slightly off in IE7-8. It looks like they have added support for standard array functions. That is, it looks like there is a prototype for this in IE7-8 mode in IE9. The problem is that the filter prototype does not work exactly as expected in underscore.

If we look at the documentation for this method on [msdn](http://msdn.microsoft.com/en-us/library/ff679973(v=vs.94).aspx) you find that this is probably a bug.

It is simple to patch the prototype implementation you find using F12 in IE. Otherwise you could use the prototype described in the [stackoverflow](http://stackoverflow.com/questions/2790001/fixing-javascript-array-functions-in-internet-explorer-indexof-foreach-etc) post (i.e. Mozilla's Array filter implementation):
[https://developer.mozilla.org/en/JavaScript/Reference/Global\_Objects/Array/filter](https://developer.mozilla.org/en/JavaScript/Reference/Global_Objects/Array/filter)
