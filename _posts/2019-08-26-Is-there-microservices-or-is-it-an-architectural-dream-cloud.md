---
layout: post
title: Is there microservices or is it an architectural dream cloud
date: 2019-08-26T13:22:44+03:00
---

## What is a microservice

There isn't a clear definition of microservices architecture unless you pick one persons strongly held beleif. This can mean that what someone considers microservices, someone else considers to be something else.

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

### [Sam Newman](https://www.oreilly.com/library/view/building-microservices/9781491950340/?_ga=2.66845933.273541594.1566813515-782116681.1564161587)

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

- [Microsofts eShop on containers](https://github.com/dotnet-architecture/eShopOnContainers)
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

Instead of going towards bigger things we will probably also see a move towards smaller services. Some of the defninitions above hint at a microservices view that is more around writing very small things that resemble functions instead of being built around a bounded context. Perhaps serverless hosting solutions will help solidify this style.

## Conclusion

Expect further confusion around the concept. We will probably see the emergence of "modular monolith" or other architectural patterns that are defined in opposition of some definition of "microservices". Some tools and patterns might become very popular creating a few competing solutions.
