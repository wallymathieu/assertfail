---
layout: post
title:  "Listening to traffic"
date: 2013-05-20T12:58:00+02:00
tags: debugging
---

While developing a web app, it's easy to inspect the traffic in the browser (chrome, IE and firefox have all the ability to show traffic related to the page you are debugging). I recently refactored a lib to remove a library and use a raw webrequest. This was a move to remove dependencies. In my tests I added machine name instead of localhost and got the traffic in Fiddler. An easy way to remove the abstraction and start accessing the real json api.
