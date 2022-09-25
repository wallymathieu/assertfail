---
layout: post
title:  "Type matching in C#"
date: 2012-11-22T19:27:00+01:00
tags: c#
---

I was thinking about how nice you have it in some languages where you can do a case statement for types. Thing is, we have a lot of <a href="https://gist.github.com/4132433">compiler goodness in C# already</a>.

By being explicit about the type and using type inference we can have a generic Case statement of a maximum length (depends on how many if else you think are ok to add).

I find it pretty sweet to write code like this:
```c#
TypeMatch.Case(exception,
  (GnarlyType e) => { HandleGnarly(e); },
  (FuncyType e1) => { HandleFunky(e1); },
  () => { Explode(); });
```
Instead of:
```c#
var e = exception as GnarlyType;
if (e!=null){ HandleGnarly(e); }
else {
  var e1 = exception as FunkyType;
  if (e1!=null){
    HandleFunky(e1);
  }else{
    Explode();
  }
}
```

### Small note

This type of feature is now part of C# proper as:
```c#
switch (exception)
{
  case GnarlyType e: HandleGnarly(e); break;
  case FunkyType e1: HandleFunky(e1); break;
  default: Explode(); break;
}
```
