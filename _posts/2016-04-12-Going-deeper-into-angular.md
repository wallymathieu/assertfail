---
layout: post
title: Going deeper into angular
date: 2016-04-12T19:32:58+02:00
tags: javascript angularjs
---

After getting to know details about ng for the last months, I've come to appreciate some of the features of angular. You can write quite clean looking code if you know enough ng. From my personal point of preference, ["scope"](https://docs.angularjs.org/api/ng/type/$rootScope.Scope) is a bit all over the place. I remember using angular for small project in 2012 not thinking much of it (angularjs shines for projects with a limited complexity).

### Before trying to write an angular app

In order to get sort of a grasp of it there are things that you should read like [ng patterns](https://github.com/johnpapa/angular-styleguide/tree/master/a1#controlleras-view-syntax). Some of these things won't make sense until you understood some ng weirdness:
[nested scopes in angularjs](http://jimhoskins.com/2012/12/14/nested-scopes-in-angularjs.html)
You may also need read up on the opposition: [angularjs the bad parts](https://larseidnes.com/2014/11/05/angularjs-the-bad-parts/).

### Understanding angularjs

Once you have read these things, you should be able to make some sense of the [ng1](https://github.com/angular/angular.js) and [ng2](https://github.com/angular/angular) code bases. There is quite a lot of documentation mixed in with the source (used to generate the api docs). It's probably better to start to read the code from the point of the api docs (if you know what area you're interested in), since [some of the code](https://github.com/angular/angular.js/blob/a4e60cb6970d8b6fa9e0af4b9f881ee3ba7fdc99/src/ngCookies/cookieStore.js) has more documentation than code. If you are planning to write something bigger (>10k lines) in typescript, it can be worth to take a look at the ng2 code base since it's an open source example of a large typescript code base and [scripting language usage of files](https://github.com/angular/angular/blob/df1f78e302e75244a71045e02ec76b7a7d8b8e8f/modules/angular2/src/common/directives.ts).

### The future

There is a lot of focus on [components](https://docs.angularjs.org/guide/component) in angular2. In earlier versions (prior to ng 1.5) you can achieve similar type of code by creating directives composed of template and controller.

My guess is that angularjs will have a sort of stable position (but it's definatelly not hip anymore).
