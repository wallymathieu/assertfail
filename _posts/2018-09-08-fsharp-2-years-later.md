---
layout: post
title: F# 2 years later
date: 2018-09-08T21:30:26+02:00
tags: f#
---

## What's the lure of F#?

The main lure of F# is that it's a surprisingly competent [ML](https://en.wikipedia.org/wiki/ML_(programming_language)) style language that transcends some of the limitations of [CIL](https://en.wikipedia.org/wiki/Common_Intermediate_Language).

From my point of view, the main distinguishing feature for F# is [Statically Resolved Type Parameters](https://docs.microsoft.com/en-us/dotnet/fsharp/language-reference/generics/statically-resolved-type-parameters). It's a feature you don't want to see in business code (same as reflection in c#), but something that enables libraries to take F# to [the next level](https://github.com/fsprojects/FSharpPlus). Compare this to [type classes](http://learnyouahaskell.com/types-and-typeclasses) in Haskell and what is called [functors](https://v1.realworldocaml.org/v1/en/html/functors.html) in OCaml.

## What has delighted me?

 - The editor tooling for f# has grown more stable.
 - That F# has another perspective (compared to C#).
 - Type providers can simplify one-off "scripting".

## What has been annoying?

Personally most of the pain points have been in dealing with .net core.

 - Type providers have recently (2018/05/08) [been fixed to work in .net core](https://blogs.msdn.microsoft.com/dotnet/2018/05/08/f-language-and-tools-update-for-visual-studio-2017-version-15-7/).
 - Using libraries intended to be consumed in c# that uses `Microsoft.Extensions.DependencyInjection` and `Microsoft.Extensions.Options` requires ceremony to use.

 These are minor things. For the most part I don't need dependency injection heavy code in the f# I've been writing.
