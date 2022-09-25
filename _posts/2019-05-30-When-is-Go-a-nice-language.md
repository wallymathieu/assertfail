---
layout: post
title: When is Go a nice language?
date: 2019-05-30T12:15:09+02:00
tags: golang
---

I've been following Go for a while due to the influence of one of my personal heroes: Ken Thompson (due to his hand in making Unix and C programming language).

Many years ago I met Douglas Crockford. At that point I was looking into low level implementation of parsers why I suggested a JVM language with more primitive structures in order to simplify implementation of more low level performance critical parts:

- If you make a JVM language with goto people will start coding web apps in it.

The comment was in a way prophetic since that's sort of what has happened with Go. In the sense that people started using what is essentially a low level language to write web applications.

## The good

### Very procedural

Go fits procedural programmers naturally: Since many programmers start out thinking procedurally and debugging code in order to understand it, it should come naturally to many developers.

There are few conceptual components of Go. Like C, it's not really a difficult language to learn (though there are some constructs related to goroutines that looks like false friends).

### Simple reflection

There are rudimentary reflection capabilities, why you could implement some standard meta programming patterns found in Java/C#.

### Compilation time

Go has short compilation time. This can improve developer happiness (reduce the code/compile/try cycle). It is also easy to use in non standard editors (as opposed to C#/Java).

### Size of docker deliverables

Compared to some other more mature languages like C# and Java: Go produces smaller docker deliverables. Though if you really care about the size of your deliverables Go might not be the optimal language (but perhaps good enough).

If you are concerned about the size of your deliverables, then you could write web apps in c with say [kore](https://kore.io/).

### Code formatter

I like that Go comes bundled with a [code formatter](https://blog.golang.org/go-fmt-your-code), since c languages otherwise leans towards bike shedding when it comes to formatting.

### Testing

There is a [nice story around testing](https://golang.org/pkg/testing/) for the language that also could improve developer productivity.

### Structural types

In order to implement an interface you use the fact that Go has a [structural type system](https://en.wikipedia.org/wiki/Structural_type_system).

## The bad

### Missing parts

One of the notable things in Go is that there are no exceptions. This is however a half truth. There are exception like functionality as can be seen on [Matt Kleins post on Medium](https://medium.com/@mattklein123/exceptional-go-1dd1488a6a47). It's not used that often, why usage of it may be frowned upon by the designers of the language.

## Conclusion

The error handling and lack of generics require you to write more code. The performance is [comparable](https://www.ageofascent.com/2019/02/04/asp-net-core-saturating-10gbe-at-7-million-requests-per-second/) to other statically typed languages. My guess is that you can be productive enough in order to write regular business code in it. It can be used as an alternative to Java and C# for when the team likes Go-style code.
