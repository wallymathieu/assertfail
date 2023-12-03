---
layout: post
title: Clean Architecture Comparison
date: 2023-12-02T20:07:01+02:00
tags: C# Java architecture
---

High level image of the clean architecture from [Uncle Bobs blog post](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html):

![The Clean Architecture image](/img/2023-12-02-Clean-Architecture-Comparison/CleanArchitecture.jpg)

Below is a comparison between clean architecture solutions in C# and Java. Most of the samples are in C#.

Note also that the solutions I've picked are somewhat arbitrarily chosen. Some have a lot of attention on GitHub while I've kept my eyes on others for a longer time.

| Sample | Use of Libraries/Structure | Grouping/Vertical slice |
| ------ | -------------------------- | ----------------------- |
| [@CanerPatir/aspnet-core-clean-arch](https://github.com/CanerPatir/aspnet-core-clean-arch) | WebApi, Infrastructure, Application, Domain libraries | Per use case grouping of folders in Application and WebApi |
| [@ivanpaulovich/clean-architecture-manga](https://github.com/ivanpaulovich/clean-architecture-manga) | WebApi, Infrastructure, Application, Domain libraries | Per use case grouping of folders in Application and WebApi |
| [@jasontaylordev/CleanArchitecture](https://github.com/jasontaylordev/CleanArchitecture) | Web, Infrastructure, Application, Domain libraries |  |
| [@mattia-battiston/clean-architecture-example](https://github.com/mattia-battiston/clean-architecture-example) | Groups entities and use cases in core project | configuration, entrypoints, dataproviders, core libraries |
| [@ardalis/CleanArchitecture](https://github.com/ardalis/CleanArchitecture) | Web, Infrastructure, UseCases, Core libraries | Per use case grouping in Application |
| [@dotnet-architecture/eShopOnWeb](https://github.com/dotnet-architecture/eShopOnWeb) | Web, PublicApi, Infrastructure, ApplicationCore libraries | Aggregate, "Service" |
| [@kgrzybek/modular-monolith-with-ddd](https://github.com/kgrzybek/modular-monolith-with-ddd) | Api, Infrastructure, Application, Domain libraries | Per subdomain projects |

There does not seem to be a clear consensus around the naming of layers. Some projects are too simple to get into grouping into slices or subdomains, some of the projects (most notably modular monolith with ddd) shows how a more fleshed out structure could look (in the case that your web api only implements one bounded domain).

| Sample | Command handler interface/base class | Query handler interface/base class |
| ------ | ------------------------------------ | ---------------------------------- |
| [@CanerPatir/aspnet-core-clean-arch](https://github.com/CanerPatir/aspnet-core-clean-arch) | [ICommandHandler](https://github.com/CanerPatir/aspnet-core-clean-arch/blob/master/src/Application/ICommandHandler.cs) | [IQueryHandler](https://github.com/CanerPatir/aspnet-core-clean-arch/blob/master/src/Application/IQueryHandler.cs) |
| [@ivanpaulovich/clean-architecture-manga](https://github.com/ivanpaulovich/clean-architecture-manga) | IOutputPort/Named | IOutputPort/Named |
| [@jasontaylordev/CleanArchitecture](https://github.com/jasontaylordev/CleanArchitecture) | [IRequestHandler](https://github.com/jbogard/MediatR/blob/6baaeef7a16ca75cb905829f870f79c6334ef40e/src/MediatR/IRequestHandler.cs) | [IRequestHandler](https://github.com/jbogard/MediatR/blob/6baaeef7a16ca75cb905829f870f79c6334ef40e/src/MediatR/IRequestHandler.cs) |
| [@mattia-battiston/clean-architecture-example](https://github.com/mattia-battiston/clean-architecture-example) | - | - |
| [@ardalis/CleanArchitecture](https://github.com/ardalis/CleanArchitecture) | [ICommandHandler](https://github.com/ardalis/Ardalis.SharedKernel/blob/c86329bf991bf0c705477b19734c5b5673d1928f/src/Ardalis.SharedKernel/ICommandHandler.cs) | [IQueryHandler](https://github.com/ardalis/Ardalis.SharedKernel/blob/c86329bf991bf0c705477b19734c5b5673d1928f/src/Ardalis.SharedKernel/IQueryHandler.cs) |
| [@dotnet-architecture/eShopOnWeb](https://github.com/dotnet-architecture/eShopOnWeb) | - | [Specification](https://github.com/ardalis/Specification) |
| [@kgrzybek/modular-monolith-with-ddd](https://github.com/kgrzybek/modular-monolith-with-ddd) | [ICommandHandler](https://github.com/kgrzybek/modular-monolith-with-ddd/blob/cb34be840c72454c633aaec57933602bc75dd8bd/src/Modules/UserAccess/Application/Configuration/Commands/ICommandHandler.cs) | [IQueryHandler](https://github.com/kgrzybek/modular-monolith-with-ddd/blob/cb34be840c72454c633aaec57933602bc75dd8bd/src/Modules/UserAccess/Application/Configuration/Queries/IQueryHandler.cs) |

The solutions presented use a couple of different patterns. Most of the solutions use classes per action while some (such as eShopOnWeb) group all of the actions into one class per entity (in this case called service-classes).

We see that [@jasontylerdev](https://github.com/jasontaylordev), [@kgrzybek](https://github.com/kgrzybek), [@ardalis](https://github.com/ardalis) in their samples marries the framework [MediatR](https://github.com/jbogard/MediatR). In the case of [@ardalis](https://github.com/ardalis) we note that he marries the framework [Ardalis.SharedKernel](https://github.com/ardalis/Ardalis.SharedKernel) in his sample. In the case of the dotnet architecture sample eShopOnWeb that solution marries [Ardalis.Specification](https://github.com/ardalis/Specification). We can only echo what Robert C. Martin writes in his book [Clean Architecture](https://www.goodreads.com/en/book/show/18043011) on page 292 that you have a extraordinarily asymmetric marriage when you take on a direct dependency on a framework. [@ardalis](https://github.com/ardalis) is aware of this fact and write in the about text on his SharedKernel project the following:

> Some useful base classes, mainly used with the CleanArchitecture template. Also, a template to make your own SharedKernel nuget package.

| Sample | Anemic domain entities |
| ---- | ---------------------- |
| [@CanerPatir/aspnet-core-clean-arch](https://github.com/CanerPatir/aspnet-core-clean-arch) | Yes |
| [@ivanpaulovich/clean-architecture-manga](https://github.com/ivanpaulovich/clean-architecture-manga) | Yes |
| [@jasontaylordev/CleanArchitecture](https://github.com/jasontaylordev/CleanArchitecture) | No |
| [@mattia-battiston/clean-architecture-example](https://github.com/mattia-battiston/clean-architecture-example) | No |
| [@ardalis/CleanArchitecture](https://github.com/ardalis/CleanArchitecture) | No |
| [@dotnet-architecture/eShopOnWeb](https://github.com/dotnet-architecture/eShopOnWeb) | No |
| [@kgrzybek/modular-monolith-with-ddd](https://github.com/kgrzybek/modular-monolith-with-ddd) | No |

The use of [anemic domain model](https://martinfowler.com/bliki/AnemicDomainModel.html) is not uncommon. A dissenting view from what Martin Fowler teaches is that you should embrace manipulating data instead of coupling data and behavior as seen in the book [Data Oriented Programming](https://www.manning.com/books/data-oriented-programming). Note also that even though the domain might be too simple in many cases, I've given the authors the benefit of doubt.
