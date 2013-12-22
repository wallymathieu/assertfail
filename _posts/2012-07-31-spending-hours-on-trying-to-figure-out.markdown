---
layout: post
title:  "Spending hours on trying to figure out why it does not check"
date: 2012-07-31T09:36:00+02:00
categories: javascript knockout
---

Yesterday I spent hours trying to figure out why a checkbox did not get checked (visually). When debugging the knockout code, it was clear that the DOM elements got checked. They did not update visually until another checkbox got checked. I tried other methods of checking the checkbox (both setAttribute and jquery) to no affect. What was even weirder is that it works the same in both chrome and IE.<br><br>
To reproduce, click on the first checkbox and then the second in <a href="http://jsfiddle.net/ozzymcduff/xpk3Y/">this fiddle</a>.<br><br>
I got the question if I had a click event handler from <a href="http://www.stealmycode.se/">steal my code</a>.<br><br>
Turns out that the reason for this behavior is that I had a click event handler on a parent DOM element. By having the click handler return true the problem <a href="http://jsfiddle.net/ozzymcduff/xpk3Y/1/">was resolved</a>.<br><br>
I still don't understand why it works like this.
<div style="clear: both;"></div>