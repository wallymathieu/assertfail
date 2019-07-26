---
layout: post
title: FSharpx.Extras
date: 2015-08-23T20:44:46+02:00
tags: f#
---

Turns out that there is a simpler way of dealing with optional values in c#.

Include FSharpx.Extras to your c# project and then you can do the following:

    optionalValue.Match(
        ifSome: value => ProcessValue(value),
        ifNone: () => NoValueToProcess()
    );

Thanks to extension methods in this library. There are extension methods for other common discriminated unions as well.
