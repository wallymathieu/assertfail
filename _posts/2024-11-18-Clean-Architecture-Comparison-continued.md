---
layout: post
title: Clean Architecture Comparison continued
date: 2024-11-18T09:06:35+02:00
---

## Background

A year ago I did a [clean architecture comparison](https://assertfail.gewalli.se/2023/12/02/Clean-Architecture-Comparison.html) for some clean architecture implementation samples online. One of the conclusions was that I did not look into how much each implementation chooses to marry different frameworks and libraries.

Since then, we have seen some updates to existing solutions. We see one solution that has been archived [eShopOnWeb](https://github.com/dotnet-architecture/eShopOnWeb), that was deeply influenced by [@ardalis](https://github.com/ardalis), that sample now lives on in [nimblepros/eShopOnWeb](https://github.com/nimblepros/eShopOnWeb). Some are not popular enough that it makes sense to keep them in this comparison. In this post we focus on C#.

## Overview

| Solution       | Domain/Core                   | Application/UseCases             | Comments  |
|----------------|-------------------------------|----------------------------------|-----------|
| [@amantinband](https://github.com/amantinband/clean-architecture/tree/582281115489ac69d048e47c7363c7832e5b425a)    | [SmartEnum](https://github.com/ardalis/SmartEnum), [error-or](https://github.com/amantinband/error-or), [MediatR](https://github.com/jbogard/MediatR), [throw](https://github.com/amantinband/throw) | FluentValidation                 | |
| [@ardalis](https://github.com/ardalis/CleanArchitecture/tree/08ddd4f33f87b5f9e388d32c49f4c1d70f3ad24a)        | [SmartEnum](https://github.com/ardalis/SmartEnum), [SharedKernel](https://github.com/ardalis/Ardalis.SharedKernel), [Specification](https://github.com/ardalis/Specification), [Result](https://github.com/ardalis/Result), [MediatR](https://github.com/jbogard/MediatR)            | ... |  |
| [@jasontaylordev](https://github.com/jasontaylordev/CleanArchitecture/tree/1b0aafdd0d10fda58d48004968343827923fd599) | [MediatR](https://github.com/jbogard/MediatR)                       | EF, FluentValidation, [AutoMapper](https://github.com/AutoMapper/AutoMapper) | database framework dependency |
| [@kgrzybek](https://github.com/kgrzybek/sample-dotnet-core-cqrs-api/tree/2f00e194e72e9288dddd69af499fc97920cba86e)       | [MediatR](https://github.com/jbogard/MediatR)                       | Dapper, FluentValidation         | database framework dependency |
| [@ivanpaulovich/clean-architecture-manga](https://github.com/ivanpaulovich/clean-architecture-manga/tree/23e3d00555e2f94f7399a21a27a193decace353b)  |  |  | Not updated |

If we summarize this table we can note that some of the very popular solutions are dependent on database frameworks in the application layer. Having a database framework dependency is generally frowned upon in Clean Architecture.

## Libraries in use

Many of the popular implementations take a dependency on popular libraries by [@jbogard](https://github.com/jbogard):

- [MediatR](https://github.com/jbogard/MediatR)
- [AutoMapper](https://github.com/AutoMapper/AutoMapper)

[amantinband](https://github.com/amantinband) introduces:

- [throw](https://github.com/amantinband/throw)
- [error-or](https://github.com/amantinband/error-or)

[@ardalis](https://github.com/ardalis) introduces:

- [Result](https://github.com/ardalis/Result)
- [SharedKernel](https://github.com/ardalis/Ardalis.SharedKernel)
- [SmartEnum](https://github.com/ardalis/SmartEnum)
- [Specification](https://github.com/ardalis/Specification)

These libraries are lightweight in that there is not much code or functionality in them.

We still note that many choose to include such libraries in the domain and or application-layer. 

## Conclusion

We see that at least one popular implementation called clean, choose to marry Entity Framework. Most of the implementations choose to include libraries. I would argue that marrying EF is something you need to be very much aware of in a Clean Architecture context. It can still be called clean, though with the addendum that it marries EF. We have a spectrum of clean depending on what [is practical for a team to implement](https://github.com/jasontaylordev/CleanArchitecture/discussions/482?sort=new#discussioncomment-6643279). I interpret this as, that there are missing patterns or language features for C# that makes mainstream implementation of Clean Architecture more of a chore.

Some of the libraries such as Result, SmartEnum and ErrorOr are needed because of missing language features in C#. These libraries are not needed in an F# solution.
