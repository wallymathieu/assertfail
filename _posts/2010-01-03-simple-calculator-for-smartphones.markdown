---
layout: post
title:  "Simple calculator for smartphones?"
date: 2010-01-03T00:23:00+01:00
tags: 
---

I'm using an iphone, but the calculator is somewhat limited. I want something a bit more like the <a href="http://en.wikipedia.org/wiki/TI-85">calculator</a> that I used in school. Perhaps one approach is to use a simple page:<br><br>
&lt;script type="text/javascript"&gt;<br>
var m = Math;<br>
var doeval = function(){<br>
var cmd = document.getElementById("commands").value;<br>
document.getElementById("history").value+=""+cmd+" : "+ eval(cmd) +"\n";<br>
};<br>
&lt;/script&gt;<br>
&lt;h2&gt;Eval&lt;/h2&gt;<br>
&lt;p&gt;&lt;label for="history"&gt;History:&lt;/label&gt;&lt;/p&gt;<br>
&lt;p&gt;&lt;textarea id="history"&gt;&lt;/textarea&gt;&lt;/p&gt;<br>
&lt;p&gt;&lt;textarea value="" id="commands" title="eval commands"&gt;&lt;/textarea&gt;&lt;/p&gt;<br>
&lt;p&gt;&lt;button id="eval" onclick="doeval(); return false;" type="button"&gt;Eval&lt;/button&gt;&lt;/p&gt;<br><br>
This works fine in safari. Question is if it works on the phone?
<div style="clear: both;"></div>