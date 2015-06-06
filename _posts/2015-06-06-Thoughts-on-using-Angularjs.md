---
layout: post
title: Thoughts on using Angularjs
date: 2015-06-06T19:06:11+02:00
tags: javascript angularjs
---

I've done some minor work using angularjs. Angular looks like a promising direction for certain type of applications.

There is a lot of drama surrounding ng2. Some of is due to the fear that ng1 applications will become obsolete when ng2 comes around without a good migration path. Jon Skeet recently blogged: [backwards compability is still hard](http://codeblog.jonskeet.uk/2015/06/03/backwards-compatibility-is-still-hard/). It will be interesting to see if the ng team manages to create a nice migration path from ng1 to ng2. Perhaps we will see ng1 having a continued existance due to the proliferation of applications written in ng1. The python community has struggled for years with python3 and the migration from earlier python versions. However, the complexity of most languages far exceeds the complexity of ng framework (but the differences between the versions looks more prominent). 

You can be productive working with ng (as with many other frameworks). This type of framework will probably stick around for a few years until someone comes up with a better way of doing client applications in javascript. I've heard criticism from Eisenberg regarding ng2, but find that Aurelia looks very [similar to ng](http://eisenbergeffect.bluespire.com/porting-an-angular-2-0-app-to-aurelia/).

What I've heard from people that have done more consulting on ng is that for complicated code the ng model of detecting changes can cause performance issues. For many business type of applications you don't need that much calculations or complicated business logic. Some people have found ng to be [hard to grok](https://news.ycombinator.com/item?id=7522520). I've talked to a former coworker who has started working with backbone. Backbone is easier to learn. You can read the entire [annotated source](http://backbonejs.org/docs/backbone.html) of backbone. This is only natural since ng has a lot more code. You might notice how ng compares to backbone is similar to the difference between rails and sinatra. Rob Conery [compares ng to rails](http://herdingcode.com/herding-code-169-tom-dale-and-rob-conery-on-the-emberjs-angularjs-cage-match-at-ndc/).

So, should you use ng on your next project? As always, it depends. For some applications a railsy type of frameworks on the serverside is the best fit (big opinionated frameworks that tell you how you should structure you code). For others, a more sinatra like approach (smaller framework focusing on fewer things). Being stuck in a predefined mould can be stifling if your domain does not lend itself to that shape. If it does, you can be fairly productive.
