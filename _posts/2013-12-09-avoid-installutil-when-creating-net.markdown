---
layout: post
title:  "Avoid installutil when creating .net services"
date: 2013-12-09T13:22:00+01:00
categories: services windows
---

There is a perfectly good solution for installing services:<br><blockquote class="tr_bq">
sc create</blockquote>
No need to inherit from the install util specific classes in your .net code. The problem with installutil is that it's not appropriate when automating install with a local service account. You also get a lot of extra code very tied to installutil.
<div style="clear: both;"></div>