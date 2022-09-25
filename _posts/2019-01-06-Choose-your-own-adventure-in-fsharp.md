---
layout: post
title: Choose your own adventure in F#
date: 2019-01-06T10:32:39+01:00
tags:  F#  C# code-style
---

When you start out on  F# your first thought might be:

``` F#
let square x = x * x

let sumOfSquares n =
   [1..n]
   |> List.map square
   |> List.sum
```

hey, that sort of looks like:

``` C#
public static class Utils
{
   public static int SumOfSquares(int n)
   {
      return Enumerable.Range(1, n)
         .Select(i => i * i)
         .Sum();
   }
}
```

Examples from [F# for fun and profit: Sum of squares](https://fsharpforfunandprofit.com/posts/fvsc-sum-of-squares/).

At a first glance,  F# looks sort like slightly different style of  C#, where instead of using extension methods you use static methods. Turns out that that's not all there is to  F#.

## Let's start from the basics

There is also an excellent source of knowledge about functional programming called [F# for fun and profit](https://fsharpforfunandprofit.com).

## Overlap of  C# and  F# coding

There are some points to being happy in  F#. For instance there is an intersection of styles for  F# and  C# where both languages are nice to use:

- Lightly functional style ( `Select` or `seq.map`, `Where` or `seq.filter`, pure functions, named types instead of using `string`, `int`, `int64`, `Dictionary<string,object>` et.c., lambda expressions)
- Simple Object Orientated code (i.e. no deep type hierarchies)
- Mutable constructs

### Prefer  F# over  C# in the case when ...

Some constructs that are easy to use in  F# need more work or make for weird  C#.

- Immutable constructs ( F# tries to steer you into immutable by default and has constructs to help you). In  C# you need something like [With](https://github.com/wallymathieu/with) or [Immutable Object Graph](https://github.com/AArnott/ImmutableObjectGraph)
- Computation expressions (builders that can help you write composable abstractions)
- Discriminated unions (in  C# your best bet is to look at [OneOf](https://github.com/mcintyre321/OneOf) or use [FSharpX](https://github.com/fsprojects/FSharpx.Extras/blob/master/src/FSharpx.Extras/CSharpCompat.fs#L297))
- Type providers (in  C# it's better to generate source code using something like t4 templates, though that can become cludgy)
- [Statically Resolved Type Parameters](https://docs.microsoft.com/en-us/dotnet/fsharp/language-reference/generics/statically-resolved-type-parameters) (can be used to avoid using reflection)

### Prefer  C# over  F# in the case when ...

Some constructs that are easy to use in  C# need more work or make for weird  F#

- Unsafe code, Native pointers (it's possible in  F#, but is more verbose)
- Goto (generally seen as an antipattern but is really useful when writing highly optimized code: think core parts of asp.net MVC)
- Deep type hierarchies (generally seen as an antipattern and in  F# the language tries to steer you away from these patterns, though in certain cases they can be useful)
- Code generation (due to type providers, there is less need for it in  F#)
- Implicit type conversions (generally seen as an antipattern, you can explicitly use [implicit operator](https://github.com/fsprojects/FSharpPlus/blob/35eb4c1b0646e4e07701c48ea4b2bdef2067caa5/src/FSharpPlus/Operators.fs#L717-L718) in  F#)

There is also a certain mainstream appeal of c style languages, why you might choose to code in  C# despite being fluent in  F#. I'm not fluent enough in VB.net to know when to use that language.

## So you have choosen  F#?

Let's say that you go start with a server or service (and worry about client or web code later).

### Web framework overview

There is a smörgåsbord of web frameworks to choose from.

- [Suave](https://suave.io) : Oldie but goodie. Some old idiosyncrasies. Need some love and major version with breaking changes removing cruft.
- [Giraffe](https://github.com/giraffe-fsharp/Giraffe) : in the style of Suave but with better performance (not as composable due to usage of Task over Async)
- [Freya](https://freya.io) : Using custom computation expressions as builders. Based on webmachine. Need some love and new major version removing cruft.
- [Frank](https://github.com/panesofglass/frank) : Recently overhauled. Frank together with Freya and Suave are the oldest  F# web frameworks. Using computation expression as builder.
- [Saturn](https://saturnframework.org) : Relatively new to the block. Using custom computation expressions as builders. Based on Pheonix and MVC patterns.
- [asp.net MVC](https://github.com/aspnet/AspNetCore) : MVC is the most common .net run of the mill object oriented web MVC framework.
- based on [IApplicationBuilder](https://docs.microsoft.com/en-us/dotnet/api/microsoft.aspnetcore.builder.iapplicationbuilder?view=aspnetcore-2.1) or OWIN: OWIN is considered dead at this point, but it played an essential role in influencing some of the work that went into asp.net core. You can compose your API in a slightly rough style by leveraging these abstractions.

The question about web framework can also be phrased as, what kind of style do you like? Roughly there are five categories.

### Function composition based : Suave, Giraffe

My personal favorite. I like being able to compose API out of function building blocks. It's both abstract and low level at the same time. Might not be appropriate for larger teams, but fits well with microservices.

Giraffe is bundled with [Newtonsoft.Json](https://www.newtonsoft.com/json) for serialization. Suave uses [DataContractJsonSerializer](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.serialization.json.datacontractjsonserializer?view=netframework-4.7.2) for serialization. Both of the libraries make it very easy to plug in your own choice of Json framework.

Personally I prefer to plug in [Fleece](https://github.com/mausch/Fleece) with [FSharp.Data](https://www.nuget.org/packages/Fleece.FSharpData/).

### Bring your own abstractions: IApplicationBuilder

Another one of my favorites. You can create your own abstractions on top of `Map`, `MapWhen` and `Run`. You can also choose to be more to the metal in order to avoid abstractions. This can be excellent in order to teach programmers about how the details of web services (or when there is little need of abstractions).

### Webmachine based : Freya

Focus here is on being true to the HTTP spec. The [webmachine diagram](https://github.com/webmachine/webmachine/wiki/Diagram) is used by people to teach themselves about HTTP.

The Freya tutorial points you in the direction of [Chiron](http://github.com/xyncro/chiron) (from the same github organization).

### CE as builder[s] : Frank, Saturn

Frank is a kind of small library that is probably good enough for many use cases. Saturn strives to be a batteries included framework.

### Object oriented : ASP.NET MVC

Even though you need some attributes to configure endpoints, you can get a lot of mileage from [TaskBuilder.fs](https://github.com/rspeele/TaskBuilder.fs) and the fact that you need less code to take in dependency injection parameters. F# shows that it can be a nice object oriented language.

The default for asp.net mvc is to use Newtonsoft.Json. It's not hard to plug in another serializer.

## What about testing your code?

### Main branches

There are two main paths of  F# testing (that I've seen). One is the *Unit style testing frameworks, the other is composable testing frameworks.

#### *Unit

- [NUnit](https://nunit.org) classic unit testing framework for .net.
- [XUnit](https://xunit.github.io) is rearchitected testing framework by some of the original team from NUnit made to make unit testing more accessible and safe (i.e. trying to steer away from antipatterns).

 If you go down this path you should check out [FsUnit](https://fsprojects.github.io/FsUnit/) that provides some extensions to make testing in  F# more enjoyable.

 XUnit will feel very familiar due to the popularity of *Unit style libraries.

#### Composable testing

- [Fuchu](https://github.com/mausch/Fuchu)
- [Expecto](https://github.com/haf/expecto) forked from Fuchu and rearchitected. This style of testing framework is based on lists of functions/methods instead of attributes. This makes it easier to compose your test code.

I'm somewhat ambivalent to XUnit vs composable testing.

### Going further down the test track

#### Property based testing

In property based testing you define the conditions for test data and let generators create that data to check your code against. These style of testing frameworks are excellent to combine with your existing testing.

- [FsCheck](https://fscheck.github.io/FsCheck/)
- [Hedgehog](https://github.com/hedgehogqa/fsharp-hedgehog)

When it comes to then add property based testing I've mostly used FsCheck.

## Going deeper down the rabbit hole!

Say that you have gotten your feet wet and tasted some of the functional goodness of  F#. Going further down you want to start to use some library to remove some of the copy paste. There are a couple of different libraries that can help you reduce your own infrastructure code.

### [F#X Extras](https://github.com/fsprojects/FSharpx.Extras)

Contains a lot of helpful various utilities. Note monoid as [an abstract class](https://github.com/fsprojects/FSharpx.Extras/blob/d51ce763762b1e277f679d01b76504da00a67b6b/src/FSharpx.Extras/Monoid.fs#L11-L12). It's under the stewardship of [fsprojects](https://github.com/fsprojects/) so accepts pull requests even though the original authors are not as involved.

### [ExtCore](https://github.com/jack-pappas/ExtCore)

ExtCore contains among other things combinations of computation expressions.

### [YoLo](https://github.com/haf/yolo)

YoLo isn't really a library, it's really a small file that gives you a bit of extra useful methods. Used by Suave to provide some common utilities for base components of  F# like `Option`, `Result` and `Choice`.

### [F#+](https://github.com/fsprojects/FSharpPlus)

My personal favorite. It's a rejection of the assumption that [ F# cannot express higher level of abstractions](https://forums.fsharp.org/t/does-f-have-a-future/237). By using for instance monad transformers you can get the same functionality (combinations of computation expressions) as in ExtCore but without having to manually code it.

## Conclusion

F# has a rich eco system of tools and frameworks. It can be a useful tool in order to deal with complexity or just to write something quick using some  F# scripts. There are many paths that you can take to get where you need to go.
