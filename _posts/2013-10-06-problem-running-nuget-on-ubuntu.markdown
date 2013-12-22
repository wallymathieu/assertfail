---
layout: post
title:  "Problem running NuGet on Ubuntu"
date: 2013-10-06T23:19:00+02:00
categories: c# nuget
---

I had some trouble running NuGet on ubuntu. I'm running an Ubuntu server. Turns out that you need to install certificates:<br><blockquote class="tr_bq">
mozroots –import –sync</blockquote>
Otherwise NuGet will fail to decode the results when fetching packages over https.<br><br><div style="clear: both;"></div>