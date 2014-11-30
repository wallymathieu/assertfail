---
layout: post
title:  "Self and the gc"
date: 2014-02-06T18:59:00+01:00
tags: javascript knockout
---

For many projects I've been using the pattern:

    ns.CtorFunction = function(){
        var self = this;
        this.doStuff = function(){
            // do stuff and use self in order to get the object variables
        }
    }

Turns out that this pattern is good for small sites with jQuery (that makes use of this in other ways). For larger code bases where you have lots of code this construction sometimes makes it difficult for the garbage collector. If you have a large single page app, then this might be an issue.

What other patterns are available?

For a knockout js site you could use the pattern:

    ns.CtorFunction = function(){
        this.doStuff = function(){
            // do stuff and use this in order to get the object variables
        }
    }

Knockout sends the appropriate context to callbacks from the view (for instance the DOM click handlers). This makes the above construction work mostly fine. This depends of course of the scope of the knockout view (changed by "with").

This might not be true for every app. My coworker [Peter](https://github.com/2hdddg) found that it depends on the amount of objects. It might be that the browser (chrome) have some limits to the amount of graph traversal that is allowed to identify entities to be garbage collected.



