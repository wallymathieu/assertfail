---
layout: post
title:  "Writing rubyish c# or porting ruby code to c#"
date: 2013-10-27T15:41:00+01:00
categories: c# ruby
---

Since I liked the ruby version for parsing <a href="https://github.com/sstephenson/global_phone">phone numbers</a>, I ported it to c#. In order to avoid having to rewrite to much I did the following:<br><br><ol>
<li>To begin with, the entire project was using ruby name convention. This simplifies things.</li>
<li>Whenever there is a missing method where the behavior of the method is not the same as the c# one, I added an extension method. For instance I implemented a variant of gsub. The behavior of this gsub uses $1 for matching groups (since it's more natural to remove a bit of code than make a full port).</li>
<li>I tried to translate different ruby constructs into c#. For instance the lazy pattern found in the library @variable ||= init_variable I had to replace with _variable ?? (_variable=InitVariable())</li>
<li>After all the tests became green and I had checked in the initial version, it was quite simple to change name convention using resharper.</li>
</ol>
<div>
The finished version is available on <a href="https://github.com/wallymathieu/GlobalPhone">github</a>.</div>
<div style="clear: both;"></div>