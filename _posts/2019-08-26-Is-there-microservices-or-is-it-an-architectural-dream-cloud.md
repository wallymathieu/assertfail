---
layout: post
title: Is there microservices or is it an architectural dream cloud
date: 2019-08-26T13:22:44+03:00
tags: microservices architecture
---

## What is a microservice

There isn't a clear definition of microservices architecture unless you pick one persons strongly held belief. This can mean that what someone considers microservices, someone else considers to be something else.

To summarize a few of the available characterizations and definitions:

### [James Levis and Martin Fowler](https://martinfowler.com/articles/microservices.html)

- organization around business capability
- automated deployment
- intelligence in the endpoints, not the transport
- decentralized control of languages and data

### [Jimmy Bogard](https://jimmybogard.com/my-microservices-faq/)

> A microservice is a service with a design focus towards the smallest autonomous boundary.

### [Gartner](https://www.gartner.com/en/documents/3898871/working-with-data-in-a-microservices-architecture)

The characterization is that microservices are

- tightly scoped
- loosely coupled
- control all access to their data

### [Sam Newman](https://www.oreilly.com/library/view/building-microservices/9781491950340/)

> Microservices are small, autonomous services that work together.

### [Smartbear](https://smartbear.com/solutions/microservices/)

> focus on building single-function modules with well-defined interfaces and operations

### [Rachel Reese](https://www.codemag.com/Article/1611071/Case-Study-Writing-Microservices-with-F)

She mentions that there are the following guidelines around such services:

- Being able to rewrite each service in fewer than six weeks
- Using DDD, wherein there should be one service per bounded context
- That each microservice has fewer than 300 lines of code
- That each microservice is a single function

She then mentions Jet.com's guidelines:

- It’s a short script file with well-defined inputs and outputs.
- It should be an application of the Single Responsibility Principle, applied at the service level.

### As seen on github

Note for instance some of the styles presented in the these examples:

- [Microsoft's eShop on containers](https://github.com/dotnet-architecture/eShopOnContainers)
- [Google Hipster shop](https://github.com/GoogleCloudPlatform/microservices-demo)

## The future of microservices

We can expect there to be different types of standardization efforts of microservices solutions. The definition of a service and microservice has deep meaning for the type of solution you can realize. Different people will sell their view of what it is and tell you that "you are doing it wrong" in order to sell consulting/tools/hosting et.c..

### Towards Angular vs React

Some sources have bigger influence than others in certain contexts, that means that different definitions can be considered decided more correct depending on the company.

Thus one potential possibility is that some organizations decides on bunch of patterns and tools that then becomes extremely popular. Compare with what has happened on the frontend side with Angular and React providing a ready made solution that tells you how you should build your app.

Kubernetes seems to have made a huge impact on the microservices world and hosting providers. The big question is if we will see any big contenders in the future.

### Towards modular monolith

Lets define it as a monolith composed of modular parts in order to structure it in a way to make development clearer. We will probably see more work towards this style of architecture due to pain around one way of defining "microservices".

See for instance [kgrzybek modular monolith](https://github.com/kgrzybek/modular-monolith-with-ddd)

### Towards functionservices

Instead of going towards bigger things we will probably also see a move towards smaller services. Some of the definitions above hint at a microservices view that is more around writing very small things that resemble functions instead of being built around a bounded context. Perhaps [serverless computing](https://en.wikipedia.org/wiki/Serverless_computing) solutions will help solidify this style.

## What problems does microservices solve

Note the focus on the following keywords: decentralized, autonomous, loosely coupled, single responsibility.

Splitting a system into separate parts can help with making it easier for developers to reason about smaller parts (given that they are sufficiently independent). It's easier to have semantic alignment in a smaller corpus.

It's harder to keep a big system consistent with new patterns compared to keeping smaller parts consistent locally. A heterogenous solution can thus imply easier local upgrades.

## What problems does microservices not solve

- How to split a system into components
- Scaling or uptime issues
- Spaghetti code
- Sliced toast bread

In order to solve these problems you need to architect your system\[s\] in such a way that these issues are feasible to address.

## Comparison with SOA

I've heard people reject some implementations as SOA. This does not make sense since you need to qualify both microservices and SOA and then end up in a straw man argument.

Note that some SOA vs microservices presentations can be used to sell a migration project from an existing SOA implementation.

## Making it clearer

Since there is no common definition of microservices, you need to define what you mean. One way to make it clearer is to offer one of the known definitions. Another way is to pick parts from others and create your own.

## Conclusion

Expect further confusion around the concept as previously [seen around SOA](https://martinfowler.com/bliki/ServiceOrientedAmbiguity.html). We will probably see the emergence of "modular monolith" or other architectural patterns that are defined in opposition of some definition of "microservices". Some tools and patterns might become very popular creating a few competing solutions.
