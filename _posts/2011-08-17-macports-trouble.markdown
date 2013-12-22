---
layout: post
title:  "Macports trouble"
date: 2011-08-17T20:47:00+02:00
categories: bash mac os x macports
---

In order to upgrade only a subset of the outdated packages for macports:<br>
port outdated | grep py2 | awk '{print $1}' | tr "\\n" " " | sed 's/^/sudo port upgrade /g' | sh<br>
To only update the packages with anything to do with "py2".
<div style="clear: both;"></div>