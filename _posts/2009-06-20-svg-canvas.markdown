---
layout: post
title:  "svg canvas"
date: 2009-06-20T13:54:00+02:00
tags: javascript jquery svg
---

<p style="margin: 0in;"><span style=";font-family:Georgia;font-size:12pt;color:black;"></span><span><span>I'm playing around with an <a href="http://keith-wood.name/svg.html">svg wrapper</a> for jquery. As mentioned in <a href="http://www.webmonkey.com/blog/How_HTML_5_Is_Already_Changing_the_Web">How_HTML_5_Is_Already_Changing_the_Web</a> this kind of programming will become more commonplace in a few years. For now I will contend with the current support for svg for this kind of development. I've tried using an svg layer as a canvas. It works really well in firefox and chrome. There was a gotcha however: I had some problem with setting the size of the canvas after it was loaded (for instance in $(document).ready(...)).</span></span></p>
<p style="margin: 0in;"><span style=";font-family:Georgia;font-size:12pt;color:black;"></span></p>
<div style="clear: both;"></div>