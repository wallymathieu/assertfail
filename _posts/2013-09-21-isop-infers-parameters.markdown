---
layout: post
title:  "Isop infers parameters"
date: 2013-09-21T09:13:00+02:00
tags: cli option
---

Command line tools should do what people expect. It's a bit chaotic to navigate how to parse command line parameters since there are many conventions.

* A single - to indicate a short parameter, that is: -a
* Two -- to indicate a long parameter, that is: --alpha
* A single / to indicate a parameter, that is: /alpha
* A single - to indicate a parameter, that is: -alpha
* A parameter followed by a space and then a value for that parameter: /alpha value
* A parameter followed by a = and then a value for that parameter: --alpha=value
* The position of the parameter (the ordinal position) to indicate simply a value

I've added code to try to infer value for a parameter using it's ordinal position when there are no ordinary parameters present before the inferred parameter value.

This simply means that it should be possible to write:

```cmd
my.exe --param1=something --param2=someother
```

and also:

```cmd
my.exe something someother
```
