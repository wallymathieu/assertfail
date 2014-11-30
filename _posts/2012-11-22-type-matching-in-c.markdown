---
layout: post
title:  "Type matching in c#"
date: 2012-11-22T19:27:00+01:00
tags: c#
---

I was thinking about how nice you have it in some languages where you can do a case statement for types. Thing is, we have a lot of <a href="https://gist.github.com/4132433">compiler goodness in C# already</a>.<br><br>
By being explicit about the type and using type inference we can have a generic Case statement of a maximum length (depends on how many if else you think are ok to add).<br><br>
I find it pretty sweet to write code like this:<br><br><blockquote class="tr_bq">
TypeMatch.Case(exception,<br>
  (GnarlyType e) =&gt; { HandleGnarly(e); },<br>
  (FuncyType e1) =&gt; { HandleFunky(e1); },<br>
  () =&gt; { Explode(); });</blockquote>
<br>
Instead of:<br><blockquote class="tr_bq">
var e = exception as GnarlyType;<br>
if (e!=null){ HandleGnarly(e); }<br>
else {<br>
  var e1 = exception as FunkyType;<br>
  if (e1!=null){<br>
    HandleFunky(e1);<br>
  }else{<br>
    Explode();<br>
  }<br>
}</blockquote>
<div style="clear: both;"></div>