---
layout: post
title:  "jQuery Context menu"
date: 2009-06-16T22:35:00+02:00
categories: javascript jquery svg
---

I'm writing an app where I have a html-canvas and render items on that canvas. The problem I ran into was that if I added a <a href="http://abeautifulsite.net/notebook/80">context menu</a> to both the items and the canvas. The problem was that I kept getting the menu for the canvas and not the items. A little debugging in firefox explained why: I only need to prevent event bubbling in order to to bind layers of html. Looking into it further there is a link on Cory's page to a <a href="http://www.trendskitchens.co.nz/jquery/contextmenu/">different</a> context menu with a more approriate api.
<div style="clear: both;"></div>