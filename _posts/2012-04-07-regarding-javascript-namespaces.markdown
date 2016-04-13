---
layout: post
title:  "Regarding javascript namespaces"
date: 2012-04-07T09:22:00+02:00
tags: javascript
---

There seems that the there is a shift from the Crockford style global variables to lower case namespaces or mixed case.
Older libraries use the Crockford style all caps.

 - [YUI](http://yuilibrary.com/yui/docs/event/basic-example.html)
 - [JSON](https://github.com/douglascrockford/JSON-js/blob/master/json2.js)

Probably this is influenced by Crockford's [thoughts about global variables](http://javascript.crockford.com/code.html)

Newer libraries use a less screamy namespace name:
jQuery, Prototype, Ext, dojo, ko