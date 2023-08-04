---
layout: post
title:  "MVVM Plus Conductor with Knockout js"
date: 2011-12-01T17:34:00+01:00
tags: JavaScript knockout crossroads
---

A better fit in the browser world for knockout than MVC is to have something like a controller. A class responsible for being an endpoint for routes. This is naturally coupled with the responsibility of changing between screens. Since controller is such a loaded word, lets simply call it conductor.  
  
That gives you the following components: Model view, view-model and conductor. In order to implement the pattern you can use crossroads js or something similar.  
  
That means that crossroads will route to different conductors that marries view-models and views and sends them off. When the view-model changes in such a way that it needs to update the url, it tells the conductor to change the url. Anyone can also ask a conductor to present an object (thus changing the url and updating the screen).
