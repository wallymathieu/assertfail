---
layout: post
title: Inheritance in JavaScript
date: 2015-12-11T17:06:44+01:00
tags: JavaScript
---

# How do you inherit from a "class" in JavaScript

Especially if you have a class that is a mix of constructor function and prototype methods and properties.

~~~ JavaScript
"use strict";
function getSeq(start){
 return function next(){
   return start++;
 };
}
var getId = getSeq(1);

function Mammal(name){
    var self = this;
    var id = getId(); // private variable
    this.getId = function(){
        return id;
    };
    Object.defineProperty(this, 'name', { // we want name to be mutable
        get:function (){ return name; },
        set:function (value) { name = value; }
    });
    this._old_name = name; // this value will be immutable

    // we want for the object to implement the same interface
    // this is a way to make objects more like java or C# objects
    Object.freeze(this);
}

Mammal.prototype.says = function(){ // but we can still add functions by adding to the prototype
    return this.saying || '';
};
~~~

## Some notes about the above code

We (me and [Peter Wilhelmsson](https://github.com/2hdddg/)) have found that the usage of "use strict" together with Object.freeze and Object.defineProperty can some JavaScript confusion (accidentally setting a new variable when you want to set an existing, hard to find initialization of objects). Usually as with many old languages with many features (c++, perl) you should choose a subset of that language to simplify for other developers.

By modifying the prototype you can always add methods even if the object itself is frozen.

## How do you create an instance of this "class"?

~~~ JavaScript
var m = new Mammal('Missan');
~~~

## How do we inherit from this "class"?

~~~ JavaScript
"use strict";
function Feline(name){
    var self = this;
    this.saying = ''
    // the last thing we do is call the base class in order to inherit and freeze this class
    Mammal.call(this,name);
}

Feline.prototype = Object.create(Mammal.prototype); // we want the methods and properties added through prototype
Feline.prototype.constructor = Feline; // but still have the correct constructor

function Cat(name){
    var self = this;
    Feline.apply(this,arguments);
}

Cat.prototype = Object.create(Feline.prototype);
Cat.prototype.constructor = Cat;
~~~

## Naming of JavaScript classes

Note that when you write:

~~~ JavaScript
namespace.Name = function (){ }
~~~

This becomes an anonymous function (in many browsers). In order to give it a name we need to write it like:

~~~ JavaScript
namespace.Name = function namespace_Name(){ }
~~~

This can be done as a post processing step in your grunt or gulp with logic similar to the following:

~~~ JavaScript
"namespace.FunctionName = function() {};".replace(
 /namespace.([^ ]+) *\= *function *\(/, function (str, gr){
   return "namespace."+gr+" = fucntion namespace_"+gr+"(";
 });
~~~

## Using pure prototype inheritance

If you are using a library that does the right thing when it comes to "this", then you can add methods to the prototype instead of "this" as a captured variable named "self".
