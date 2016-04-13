---
layout: post
title:  "Programming javascript"
date: 2009-07-18T18:40:00+02:00
tags: javascript jquery lint
---

In the first course in computer science we (students) received the following words of wisdom from the lecturer:
Above anything avoid javascript.

### Pure javascript

A few years later I started working as a programmer (late 2005) the need to do certain small things arose; impossible without the use of javascript. One of my coworkers showed me how to add some bits of extra functionality that the users needed (easier user interface). Later on there was a need for drag and drop in the browser. I implemented this by using code from another coworker. I updated an editor for presenting study programs. I feel that that experience is a failure. It took me at least 2-3 weeks to get something that wasn't decent enough. I tried to write good code, but failed. Both the server-side and client-side code is a mess. Fortunately this code is rendered obsolete by the fact that the system I worked on contains more information and therefore can generate such presentations without any manual  editing. What I am trying to say: That coding experience sucked.

### Javascript library: jQuery

Fast forward to 2009. I've started working in a team developing what can best be described as an advanced editor (specialized for one purpose) on the web. Enter jQuery: Rich text editing, ajax, items that can be saved without the whole form being submitted, et.c.. The weirdness of developing javascript almost gone:
 - Doing manipulations on the HTML using jQuery yields more predictable results.
 - Navigating the DOM via jQuery works the same way across different browsers.
 - Events encapsulated by jQuery work the same in different browsers.
 - The terse syntax of jQuery reduces the amount of code.

Because of the above the quality of the code increases.

### Lint

Since there is no compilation of javascript there is a need to use some form of lint on the code to catch syntax errors, legal javascript but bad syntax et.c.. There are two javascript lint implementations that I know of: <a href="http://javascriptlint.com/">javascript lint</a> and <a href="http://www.jslint.com/">jslint</a>. I use both. Jslint is a bit harder to set up in visual studio, but is stricter and finds more errors (out of the box). I might not have read enough of the documentation for javascript lint in order to use it efficiently. With the use of lint hard to find bugs and errors can be found in a matter of minutes instead of days, makes these tools invaluable.
