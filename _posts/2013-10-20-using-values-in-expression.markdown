---
layout: post
title:  "Using values in expression"
date: 2013-10-20T11:47:00+02:00
tags: c#
---

I've done some small tests while writing the library to handle <a href="https://www.nuget.org/packages/With/">readonly objects in c#.</a> Turns out that getting the value of a sub expression can be costly (since you have to compile the expression and execute). When just setting one property there can be a performance benefit of using the following syntax:<br><blockquote class="tr_bq">
<pre style="background-color: #f8f8f8; border-bottom-left-radius: 3px; border-bottom-right-radius: 3px; border-top-left-radius: 3px; border-top-right-radius: 3px; border: 1px solid rgb(221, 221, 221); color: #333333; font-family: Consolas, 'Liberation Mono', Courier, monospace; font-size: 13px; line-height: 19px; margin-top: 15px; overflow: auto; padding: 6px 10px;"><code style="background-color: transparent; border-bottom-left-radius: 3px; border-bottom-right-radius: 3px; border-top-left-radius: 3px; border-top-right-radius: 3px; border: none; font-family: Consolas, 'Liberation Mono', Courier, monospace; font-size: 12px; margin: 0px; padding: 0px; word-wrap: normal;">new MyClass(1, "2").With(m =&gt; m.MyProperty, 3)</code></pre>
</blockquote>
There might be some way of optimizing the code in order to get better performance for the form:<br><blockquote class="tr_bq">
<pre style="background-color: #f8f8f8; border-bottom-left-radius: 3px; border-bottom-right-radius: 3px; border-top-left-radius: 3px; border-top-right-radius: 3px; border: 1px solid rgb(221, 221, 221); color: #333333; font-family: Consolas, 'Liberation Mono', Courier, monospace; font-size: 13px; line-height: 19px; margin-top: 15px; overflow: auto; padding: 6px 10px;"><code style="background-color: transparent; border-bottom-left-radius: 3px; border-bottom-right-radius: 3px; border-top-left-radius: 3px; border-top-right-radius: 3px; border: none; font-family: Consolas, 'Liberation Mono', Courier, monospace; font-size: 12px; margin: 0px; padding: 0px; word-wrap: normal;">new MyClass(1, "2").With(m =&gt; m.MyProperty == 3)</code></pre>
</blockquote>
If there are only a few usages then the performance hit is probably negligible.
<div style="clear: both;"></div>