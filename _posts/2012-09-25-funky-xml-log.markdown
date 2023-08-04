---
layout: post
title:  "Funky xml log"
date: 2012-09-25T08:13:00+02:00
tags: log xml
---

I had some trouble where a simple parser would take a bit of time. Turns out that there were many ways of improving this performance. I rewrote it to use the xml reader instead to be able to do [these improvements](http://www.hanselman.com/blog/XmlAndTheNametable.aspx). Some funky bugs got squished. The reader is a bit low level compared to niceties such as [Nokogiri](http://nokogiri.org/) (in hindsight, maybe I should have been using). By using this class I could avoid some funkiness of XmlDocument having to cope with weird xml at the expense of having less appealing code: [LogEntryParser](https://github.com/wallymathieu/log4net-logviewer/blob/master/Core/LogEntryParser.cs).
