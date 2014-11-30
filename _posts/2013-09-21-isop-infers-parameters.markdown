---
layout: post
title:  "Isop infers parameters"
date: 2013-09-21T09:13:00+02:00
tags: cli option
---

Command line tools should do what people expect. It's a bit chaotic to navigate how to parse command line parameters since there are many conventions.<br><br><ul>
<li>A single - to indicate a short parameter, that is: -a</li>
<li>Two -- to indicate a long parameter, that is: --alpha</li>
<li>A single / to indicate a parameter, that is: /alpha</li>
<li>A single - to indicate a parameter, that is: -alpha</li>
<li>A parameter followed by a space and then a value for that parameter: /alpha value</li>
<li>A parameter followed by a = and then a value for that parameter: --alpha=value</li>
<li>The position of the parameter (the ordinal position) to indicate simply a value</li>
</ul>
<div>
I've added code to try to infer value for a parameter using it's ordinal position when there are no ordinary parameters present before the inferred parameter value.</div>
<div>
<br>
</div>
<div>
This simply means that it should be possible to write:</div>
<blockquote class="tr_bq">
<span style="background-color: black; color: #cccccc;">my.exe --param1=something --param2=someother</span>
</blockquote>
<div>
and also:</div>
<div>
</div>
<br><blockquote class="tr_bq">
<span style="background-color: black; color: #cccccc;">my.exe something someother</span>
</blockquote>
Please register any bugs on <a href="https://github.com/wallymathieu/isop/issues?direction=desc&amp;sort=created&amp;state=open">github</a>. The new version is available on <a href="https://www.nuget.org/packages/Isop">nuget</a>.<br><div>
<br>
</div>
<br><div>
</div>
<div style="clear: both;"></div>