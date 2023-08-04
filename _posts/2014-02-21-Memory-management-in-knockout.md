---
layout: post
title: Memory management in knockout
date: 2014-02-21T21:21:50+01:00
tags: JavaScript knockout
---

## Explicit use of computed?

What does a computed expression like this:

~~~ JavaScript
this.isBusy = ko.computed(function() {
    return self._isBusy() || self._queryIsBusy();
});
~~~

have to do with

~~~ html
<div data-bind="visible: _isBusy() || _queryIsBusy()" ></div>
~~~

Internally knockout creates a computed out of an expression in a binding handler. Ko does not parse the expression in the html above to register the variables _isBusy or _queryIsBusy.

## Consequenses

What does this mean for your code?

If you have something below but want to move the logic to your class from the view:

~~~ html
<div data-bind="visible: _isBusy() || _queryIsBusy()" ></div>
~~~

You have two main options:

Option 1

~~~ JavaScript
Object.defineProperty(self, 'isBusy', {
    get: function() {
           return _isBusy() || _queryIsBusy();
    }
});
~~~

~~~ html
<div data-bind="visible:isBusy" ></div>
~~~

Option 2

~~~ JavaScript
this.isBusy = function() {
    return _isBusy() || _queryIsBusy();
};
~~~

~~~ html
<div data-bind="visible:isBusy()" ></div>
~~~

Notice '()'

## Life cycle

How long does the computed that knockout creates live?

A bit simplified if you read the code for KO you find that knockout makes new computed (internally dependent observable) with option:
```disposeWhenNodeIsRemoved```
This means that knockout will remove the list of references to observables that the computed depends on when the DOM-node that the computed is associated with have been removed.

## When is it safe to use a computed?

When you know the life span of the computed you have created.

## Why is it generally bad to use computed willy nilly

It is generally hard to reason about when they will be disposed. It is easy to access exposed ko.computed from different objects in the system with different life span.

