---
layout: post
title: Architecture and functional programming
date: 2023-02-05T12:59:11+02:00
---

This post is a continuation of [Unclean architecture](https://assertfail.gewalli.se/2022/09/22/Unclean-architecture.html).

## Clean architecture

From what I understand of [Clean architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) it's an iteration of [Hexagonal architecture](https://en.wikipedia.org/wiki/Hexagonal_architecture_(software)) also known as Ports and Adapters (see the Wikipedia page).

### Clean architecture use of OO and code dependency

> OO is the ability, through the use of polymorphism, to gain absolute control over every source code dependency in the system. It allows the architect to create a plugin architecture, in which modules that contain high-level policies are independent of modules that contain low-level details. The low-level details are relegated to plugin modules that can be deployed and developed independently from the modules that contain high-level policies.

*Martin, Robert C. . Clean Architecture (Robert C. Martin Series) (p. 47). Pearson Education. Kindle Edition.*

As we have seen around functional programming there are [many ways of dealing with dependencies](https://fsharpforfunandprofit.com/posts/dependencies/).

### Compare to pure and impure

Compare [Impureim sandwich](https://blog.ploeh.dk/2020/03/02/impureim-sandwich/) with the hexagonal/clean/ports and adapters architecture

The question then is if the domain is supposed to be free from external code so that you have only code that you yourself understand or if it's supposed to only be code without external IO/side-effects?

A clean as in pure functional domain without IO will be:

- Testable
- Independent of DB, external agency, UI

In the same way as a clean architecture. There might be implicit dependency on DB, UI et.c. due to features or flows that implies such. We even have Mark Seemann argue that [functional architecture is Ports and Adapters](https://blog.ploeh.dk/2016/03/18/functional-architecture-is-ports-and-adapters/).

## Existence of clean code

There are people that argue that there is [no such thing as clean code](https://www.steveonstuff.com/2022/01/27/no-such-thing-as-clean-code).

The problem is that low level vs high level is not a clear enough concept.

It feels like what Robert Martin is trying to describe is the business domain code without other peoples code (except when you really trust it), without code for IO like http, file access et.c..

You could perhaps argue that when trying to come up with a clean architecture for Haskell then one way to define such a scheme could be to you isolate your business code from any IO (something quite feasible in Haskell). The benefit of using some of the functional programming concepts is that they at least have a formal definition that can be verified.

My guess is that the problem is that for many senior developers/programmers clean code is related to feelings of cleanliness, so will be apparent to programmers that have gotten a feeling for it (my guess being that you would teach that through literary workshops).

## Conclusion

FP concepts have come to have a broad influence over many mainstream core frameworks (see the functional concepts in [Java](https://www.baeldung.com/java-functional-programming) and [C#](https://en.wikipedia.org/wiki/Language_Integrated_Query) base libraries). We can argue that these concepts give us tools and definitions that help remove the fluff around the definitions. The downside is that the language of functional programming is often unfamiliar and feels foreign to many developers (why it makes sense to [use the concepts without explicitly mentioning mentioning them](https://fsharpforfunandprofit.com/about/#banned)).
