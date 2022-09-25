---
layout: post
title:  "Using readonly objects in C#"
date: 2013-10-18T19:39:00+02:00
tags:  C#
---

One thing I like about  F# is the ability to use readonly objects in a way that does not require a lot of code. I've done a small lib inspired by this ability of F#: [with](https://github.com/wallymathieu/with)

The syntax is a bit special since I assume that the properties have a private set.

## versions prior to 5

``` C#
myobject.With(m => m.Property1 == 3 && m.Property2 == "3")
```

## With 5+

``` C#
using With;
...
public class SomeClass
{
    private static readonly IPreparedCopy<MyClass, int, string> PreparedCopy =
        Prepare.Copy<MyClass, int, string>((m,v1,v2) => m.Property1 == v1 && m.Property2 == v2);
    public async Task<MyClass> Handle()
    {
        // fetch instance of MyClass, say:
        var myObject = await _storage.Load(someId);
        // change the name of that customer:
        var copy = PreparedCopy.Copy(myObject, 3, "3");
        // ...
    }
}
```

The reason for this style of syntax is due to the fact that compiling expressions are potentially expensive, why you'd want to have a similar pattern as compiled regex.
