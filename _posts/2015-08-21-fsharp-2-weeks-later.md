---
layout: post
title: f# 2 weeks later
date: 2015-08-21T17:17:39+02:00
tags: f#
---

Since I've been without an assingment I've had the time to look into f# more.

## Where did I find material?

 - [fsharpforfunandprofit](http://fsharpforfunandprofit.com/)
 - [functional programming on slack](http://fpchat.com/)
 - stackoverflow

## Why did I start looking into f# again?

 I share the office with [Fredrik Forssen](https://github.com/wastaz). I find his love of f# inspiring.

## Things I've found that delighted me:

 - Less ceremony to declare classes, records, methods and functions (when you get used to how you write it)
 - Easier to compose things (for instance if you want to create a chain in order to use many different classes together for an import)
 - Monad support (and yes, I know that these things can very easily be abused)
 - Package manager and Build tool that works well together ([paket](https://github.com/fsprojects/Paket) and [fake](https://github.com/fsharp/FAKE)).
 - Records defined in f# are like hand coded readonly classes with IEquatable and IComparable implemented

## I've previously found the following sweet when looking at the language:

 - Immutable by default
 - Language construct to create a clone of a record but with different values for some fields
 - Language construct to match more than hard coded strings, enums and integers

## What is kind of annoying about the language (and tools related to it)

 - If you forget to add an equals sign to a type or module declaration you get weird compiler errors
 - Gui tooling is still a bit alpha (the command line version works great)
 - It's easy to create a f# project where you need to manually edit the fsproj file in order to get it to work on mono and windows (this was a problem in the early days of NuGet)
 - Almost all the library methods in .net becomes a tuple parameter in f#, this is a bit confusing since it looks like an ordinary function call in c#
 - Exposing f# Option on your types makes it harder to interact with your f# code from c#

~~~ c#
    using OptionalUrl = Microsoft.FSharp.Core.FSharpOption<Customers.Url>;
    ...
       var customer = new Customer(
          ...
          pictureUri: OptionalUrl.Some(new Url("http://someurl.com/something?some=asd"))
       );
~~~
