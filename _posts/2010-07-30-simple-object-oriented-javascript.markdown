---
layout: post
title:  "Simple object oriented JavaScript"
date: 2010-07-30T09:48:00+02:00
tags: JavaScript jquery
---

The jQuery approach is to avoid object orientation. This is an excellent way of avoiding bloat for small JavaScript hacks. If you're starting to build JavaScript heavy applications then you might need to start organizing your code. The first thing you should learn is how to write jQuery plugins. Later on you will need to learn some simple object orientation. Here's how:

~~~ JavaScript
function TigerType(name){
    var that = this; this.name = name; this.sound = "growl!";
    this.roar = function(){ return that.sound; };
}
var tigerInstance = new TigerType();
alert(tigerInstance.roar());
~~~

Note that I'm declaring a variable "that". If you work with jQuery you know that this will be set to something else. By using a scoped variable you will avoid this problem.
So what about inheritance? The simple solution is to use call or apply.

~~~ JavaScript
function TigerWithTeethType(name){
    var that = this;
    TigerType.call(this,name);
    this.bite = function(){ /*some code to bite the programmer ;)*/ };
}
~~~

Since TigerType is a function, call and apply can be used to execute it with the "this" of TigerWithTeethType. This way has the advantage of being simple and jQuery safe.
You might also want to look into:

- [http://ejohn.org/blog/simple-javascript-inheritance/](http://ejohn.org/blog/simple-javascript-inheritance/)
- [http://www.crockford.com/javascript/inheritance.html](http://www.crockford.com/javascript/inheritance.html)
- [http://bolinfest.com/javascript/inheritance.php](http://bolinfest.com/javascript/inheritance.php)

Try to avoid object orientation when writing JavaScript. If you're doing small things then there is no need for the added complexity of object orientation (in JavaScript).
