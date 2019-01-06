---
layout: post
title: Choose your own adventure in F#
date: 2019-01-06T10:32:39+01:00
tags: f# c# code-style
---

When you start out on f#

## Start from the basics

In order to write beautiful F# you should first learn to follow the [F# design guidelines](http://fsharp.org/specs/component-design-guidelines/).

Take it easy, let it sink in. Some of the guideline suggestions are in line with what you already know when it comes to programming. Once you have learned the guidelines, you can use your [poetic license](https://en.wikipedia.org/wiki/Artistic_license) to bend the rules.

## Overlap of c# and f# coding

There are some points to being happy in f#. For instance there is an intersection of styles for f# and c# where both languages are nice to use:

 - Lightly functional style ( `Select` or `seq.map`, `Where` or `seq.filter`, pure functions, named types instead of using `string`, `int`, `int64`, `Dictionary<string,object>` et.c., lambda expressions)
 - Simple Object Orientated code (i.e. no deep type hierarchies)
 - Mutable constructs

### Prefer f# over c# in the case when ...

Some constructs that are easy to use in f# need more work or make for weird c#.

 - Immutable constructs (f# tries to steer you into immutable by default and has constructs to help you). In c# you need something like [With](https://github.com/wallymathieu/with) or [Immutable Object Graph](https://github.com/AArnott/ImmutableObjectGraph)
 - Computation expressions (builders that can help you write composable abstractions)
 - Discriminated unions (in c# your best bet is to look at [OneOf](https://github.com/mcintyre321/OneOf) or use [FSharpX](https://github.com/fsprojects/FSharpx.Extras/blob/master/src/FSharpx.Extras/CSharpCompat.fs#L297))
 - Type providers (in c# it's better to generate source code using something like t4 templates, though that can become cludgy)
 - [Statically Resolved Type Parameters](https://docs.microsoft.com/en-us/dotnet/fsharp/language-reference/generics/statically-resolved-type-parameters) (can be used to avoid using reflection)

### Prefer c# over f# in the case when ...

Some constructs that are easy to use in c# need more work or make for weird f#

 - Unsafe code, Native pointers (it's possible in f#, but is more verbose)
 - Bit fiddling (this is also possible in f#, but also more verbose)
 - Goto (generally seen as an antipattern but is really useful when writing highly optimized code: think core parts of asp.net MVC)
 - Deep type hierarchies (generally seen as an antipattern and in f# the language tries to steer you away from these patterns, though in certain cases they can be useful)
 - Null values (generally seen as an antipattern, f# tries to steer you away from using null values, c# 8 let's you go in the same direction)
 - Code generation (due to type providers, there is less need for it in f#) 
 - Implicit type conversions (generally seen as an antipattern, you can explicitly use [implicit operator](https://github.com/fsprojects/FSharpPlus/blob/35eb4c1b0646e4e07701c48ea4b2bdef2067caa5/src/FSharpPlus/Operators.fs#L717-L718) in f#)

There is also a certain mainstream appeal of c style languages, why you might choose to code in c# despite being fluent in f#. I'm not fluent enough in VB.net to know when to use that language.

## So you have choosen f#?

Let's say that you go start with a server or service (and worry about client or web code later).

There is a smörgåsbord of frameworks to choose from. 
