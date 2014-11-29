---
layout: post
title: Thoughts on using knockout for the last years
date: 2014-11-18T21:11:43+01:00
categories: javascript knockout
---

It feels very much like the next step after jquery+templates. The nice part is that this enables you to choose your own strategy. For instance only using small amounts of code and regular forms. It requires a lot of decisions about structure decided already in a lot of js mvvm frameworks. These frameworks look like rails for client-side coding. Great for certain types of problems, but requires learning how to use it. Like always, if you can accept the limitations you get a boon. The big problem is that it's hard to know such things in advance. For small apps jquery might be best. For larger single page like applications you should evaluate the larger frameworks.

Having a lot of knockout computed observables requires that you dig down into the Ko code base. This will probably improve with the maturity of Ko. A lot of computed observables can be created implicitly using a function in the view. On the knock me out blog there is some required reading [Cleaning Up After Yourself in Knockout.js](http://www.knockmeout.net/2014/10/knockout-cleaning-up.html).

There might be improvements of IOC in javascript. Dispose and life cycle could be very useful for some single page apps. For knockout this amplified if you need long living objects. Need to evaluate the different IOC containers out there. Problem is that there is no dispose only a delete in plain javascript (how do you clean up from X?).

Having a proper url simplifies a lot of things. You have to do a lot of complicated code when your user interface creates a view that can't be navigated to in the ordinary sense. Adding things like filter or navigation context can help you avoid hard to answer customer answers why certain things won't work. Having the routing primarily server side can also simplify testing.
