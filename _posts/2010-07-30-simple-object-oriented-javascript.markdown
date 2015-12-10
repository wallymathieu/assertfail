---
layout: post
title:  "Simple object oriented javascript"
date: 2010-07-30T09:48:00+02:00
tags: javascript jquery
---

The jQuery approach is to avoid object orientation. This is an excellent way of avoiding bloat for small javascript hacks. If you're starting to build javascript heavy applications then you might need to start organizing your code. The first thing you should learn is how to write jQuery plugins. Later on you will need to learn some simple object orientation. Here's how:
```javascript
function TigerType(name){
    var that = this; this.name = name; this.sound = "growl!";
    this.roar = function(){ return that.sound; };<br>
}
var tigerInstance = new TigerType();
alert(tigerInstance.roar());
```
Note that I'm declaring a variable "that". If you work with jQuery you know that this will be set to something else. By using a scoped variable you will avoid this problem.
So what about inheritance? The simple solution is to use call or apply.

```javascript
function TigerWithTeethType(name){
    var that = this;
    TigerType.call(this,name);
    this.bite = function(){ /*some code to bite the programmer ;)*/ };
}
```
Since TigerType is a function, call and apply can be used to execute it with the "this" of TigerWithTeethType. This way has the advantage of being simple and jQuery safe.
You might also want to look into:
- <a href="http://ejohn.org/blog/simple-javascript-inheritance/">http://ejohn.org/blog/simple-javascript-inheritance/</a>
- <a href="http://www.crockford.com/javascript/inheritance.html">http://www.crockford.com/javascript/inheritance.html </a>
- <a href="http://bolinfest.com/javascript/inheritance.php">http://bolinfest.com/javascript/inheritance.php</a>

Try to avoid object orientation when writing javascript. If you're doing small things then there is no need for the added complexity of object orientation (in javascript). 
