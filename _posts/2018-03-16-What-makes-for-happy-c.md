---
layout: post
title: What makes for happy C#?
date: 2018-03-16T11:51:45+01:00
tags: C# ruby
---

One of the questions I've started asking myself is what makes for happy C#? After a few years getting a bit more understanding of ML like languages like F# I've started to realize that C# is not built to write the kind of code that you write in an ML. Instead, you are happier when you embrace the Ruby-like patterns in C#. If you look at C# sort of like a typed Ruby like language: Object orientation, mutability first and meta programming using reflection. When you see that this is shared between the two languages then more things make sense. I've noticed that good Ruby code translates very easily to good C# (although [not always](https://github.com/wallymathieu/csharp_ukanren)). Same is not true for good F# or Haskell.

Good Ruby code tries to keep a nice clean programming surface for the user (of a library).

Ruby is very object oriented. C# shares this trait since it is very adamant in that you need to have a class in order to have any code. Extension methods can be used to make a sort of monkey patching in C#. Monkey patching in Ruby can be dangerous, but applied right can help clean up your code. Same is true for extension methods. I would call a nice extension method to be polite: It only uses the extended type and any parameters sent in.

## Architecture that fits C# and Ruby

Having smaller libraries with their own solution means that it's easier for people to reason about the code. There are some downsides of this approach though: You need to keep libraries in lockstep when introducing breaking changes during a larger refactoring. You need to be careful about what kind of public API surface you accidentally introduce. It's easy to introduce leaky concepts (concepts and abstracts that require you to write code to deal with a specific concept in many different places).

Writing micro services is another way of splitting up your code base. However, you need to know when it's worth putting something in a separate library and when it's useful to have it in a service. A service can easily introduce latency and give you bad performance. If you try to follow [Martin Fowlers advice](https://martinfowler.com/bliki/BoundedContext.html) and apply that to your microservices, you can have relatively separate services (that they don't cause performance issues because of hard coupling requiring many buss events or http calls to complete actions).

Having relatively small services (but not to small), means that it can be easier to reason about mutable first procedural code. I find it very difficult to try to reason about large a large code base with mutable instances.

## Deviations

Since we have static analysis available through the compiler, we can use that to define value types and wrap strings, integers, et.c. when dealing with many different small id-types or values that are easy to mix up. I.e. value types of a single value. In Haskell you call this a [Newtype](https://wiki.haskell.org/Newtype). In C# you need to do a bit [more work](https://github.com/NewtonsoftJsonExt/Saithe/blob/master/CSharpTypes/ProductId.cs). If you have many of these types, you might want to create a [t4-template](https://en.wikipedia.org/wiki/Text_Template_Transformation_Toolkit) for it. In Ruby you would (due to the dynamic nature of the language) not need a template for it.

