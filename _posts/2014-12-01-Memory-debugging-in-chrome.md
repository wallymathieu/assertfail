---
layout: post
title: Memory debugging in chrome
date: 2014-12-01T06:57:05+01:00
tags: javascript
---

In february there was some problems with memory leaks in the product I worked with

```js
Namespace.NameOfType = function(){
    ...
};
```

note that the debugger picks up on

```js
function NameOfType(){
    ...
};
```

you could use a simple regex to rewrite to

```js
Namespace.NameOfType = function Namespace_NameOfType(){
    ...
};
```

and also a regex + logic to rewrite

```js
this.NameOfFunc = function Namespace_NameOfType_NameOfFunc(){
    ...
};
```

It would look horrible in you source code (and easy to get wrong)

