---
layout: post
title:  "Using readonly objects in c#"
date: 2013-10-18T19:39:00+02:00
categories: c#
---

One thing I like about f# is the ability to use readonly objects in a way that does not require a lot of code. I've done a small lib inspired by this ability of f#: <a href="https://github.com/wallymathieu/with">with</a><br><br>
The syntax is a bit special since I assume that the properties have a private set.<br><br><blockquote class="tr_bq">
<pre style="background-color: #f8f8f8; border-bottom-left-radius: 3px; border-bottom-right-radius: 3px; border-top-left-radius: 3px; border-top-right-radius: 3px; border: 1px solid rgb(221, 221, 221); color: #333333; font-family: Consolas, 'Liberation Mono', Courier, monospace; font-size: 13px; line-height: 19px; margin-top: 15px; overflow: auto; padding: 6px 10px;"><code style="background-color: transparent; border-bottom-left-radius: 3px; border-bottom-right-radius: 3px; border-top-left-radius: 3px; border-top-right-radius: 3px; border: none; font-family: Consolas, 'Liberation Mono', Courier, monospace; font-size: 12px; margin: 0px; padding: 0px; word-wrap: normal;">myobject.With(m =&gt; m.Property1 == 3 &amp;&amp; m.Property2 == "3")</code></pre>
</blockquote>
<div style="clear: both;"></div>