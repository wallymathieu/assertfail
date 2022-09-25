---
layout: post
title: Java vs C#
date: 2019-06-15T19:37:10+02:00
tags: java C#
---

Java started out as a very object oriented language. One of the nice things with Java (as a language) has been that the syntax has been quite stable for a long time. C# competes with Java for mainstream developer mindshare. C# has pushed better tooling and more features but was primarily focused on Windows.

For the last few years we have seen .net becoming a truer cross platform language with the .net core project and Microsofts acquisition of Xamarin. Due to the push towards micro services and Docker this makes a lot of sense since we will probably see more large scale enterprise software use some sort of micro service architecture to allow scaling of development teams.

## Features

### Implemented in both

#### Language Features

Some of the features we know and love in C# is nowadays also part of modern Java:

- The ability to create a small lambda simplifies many programming tasks why the [functional interfaces in Java 8](https://www.baeldung.com/java-8-functional-interfaces) is a nice addition.
- Many of the bread and butter collection operations seen as [extension methods](https://docs.microsoft.com/en-us/dotnet/api/system.linq.enumerable?redirectedfrom=MSDN&view=netframework-4.8#methods) in .net are available by using [java.util.stream](https://www.baeldung.com/java-8-streams-introduction)
- There is local variable type inference with `var` in Java 10
- In more modern Java you can write `try (T instance=new ExpensiveResource()){ ... }` to automatically dispose an instance that [implements the AutoCloseable interface](https://docs.oracle.com/javase/tutorial/essential/exceptions/tryResourceClose.html).

In the C# corner we are waiting on C# 8 for:

- [Default interface implementation](https://devblogs.microsoft.com/dotnet/default-implementations-in-interfaces/) that we have seen used in Java since Java 8.

We see that Java uses standard generic class `Optional<>` with methods while C# uses `?.` and `??` operators and uses `Nullable<>` for value types.

#### Tooling

Using Visual Studio Code to develop Java feels very productive. Using Jetbrains Intellij is nicer. I'm not a fan of Eclipse. For C# I usually prefer Visual Studio while Visual Studio Code works and you get some more sweet refactorings in Rider (or through Resharper).

Both Maven and NuGet are mature and enable decomposition into libraries.

### Missing features added through extension

The missing part that becomes quite obvious as you start working on any project in Java is the lack of auto properties. However, there is [Project Lombok](https://projectlombok.org) that removes a lot of boilerplate from your code.

You would expect that in C# you'd use [t4 template](https://www.hanselman.com/blog/t4-text-template-transformation-toolkit-code-generation-best-kept-visual-studio-secret) (or [Roslyn Source generators](https://docs.microsoft.com/en-us/dotnet/csharp/roslyn-sdk/source-generators-overview)) to reduce boilerplate.

### Missing features

There isn't any generic support in the Java runtime. This leads to some weirdness around [type erasure](https://www.baeldung.com/java-type-erasure).

There isn't any [anonymous interface implementation in C#](https://www.baeldung.com/java-anonymous-classes), but there is in Java (and [something similar in F#](https://docs.microsoft.com/en-us/dotnet/fsharp/language-reference/object-expressions)).

## Style

### Differences

The style of stream and the usage of words are more in line with many other languages (see for instance Javascript, Ruby, Python). Notice the use of `map`, `filter` and `reduce` while in C# LINQ is more in line with SQL. This gives the code a slightly different flavor.

Checked exceptions cause some boilerplate code that becomes a bit more manageable with [Result](https://doc.rust-lang.org/std/result/) style error handling.

### Similarities

There [is validation in Java](https://hibernate.org/validator/documentation/getting-started/) similar to the familiar attribute based validation in .net.

There are popular MVC frameworks for both. [Spring](https://spring.io/) should feel familiar to anyone using asp.net MVC.

There are some gotchas, but any .net developer or Java developer should be able to work in both. There might be a short term productivity loss.

## Conclusion

Both languages have mature editor support. Many of the bread and butter programming tasks have feature support in both languages. There are some stylistic differences between the languages.
