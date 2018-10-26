---
layout: post
title:  "Using readonly objects in c#"
date: 2013-10-18T19:39:00+02:00
tags: c#
---

One thing I like about f# is the ability to use readonly objects in a way that does not require a lot of code. I've done a small lib inspired by this ability of f#: [with](https://github.com/wallymathieu/with)  
  
The syntax is a bit special since I assume that the properties have a private set. 

## versions prior to 5

```c#
myobject.With(m => m.Property1 == 3 && m.Property2 == "3")
```

## With 5+

```c#
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
