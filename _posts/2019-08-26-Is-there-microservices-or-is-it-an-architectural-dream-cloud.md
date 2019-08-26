---
layout: post
title: Is there microservices or is it an architectural dream cloud
date: 2019-08-26T13:22:44+03:00
---

## What is a microservice

There isn't a clear definition of microservices architecture unless you pick one persons strongly held beleif. This can mean that what someone considers microservices, someone else considers to be something else.

### From [martinfowler.com](https://martinfowler.com/articles/microservices.html)

- organization around business capability
- automated deployment
- intelligence in the endpoints, not the transport
- decentralized control of languages and data

### From [jimmybogard.com](https://jimmybogard.com/my-microservices-faq/)

> A microservice is a service with a design focus towards the smallest autonomous boundary.

### From [Gartner](https://www.gartner.com/en/documents/3898871/working-with-data-in-a-microservices-architecture)

The characterization is that microservices are

- tightly scoped
- loosely coupled
- control all access to their data

### From [Sam Newman](https://www.oreilly.com/library/view/building-microservices/9781491950340/?_ga=2.66845933.273541594.1566813515-782116681.1564161587)

> Microservices are small, autonomous services that work together.

### From [Smartbear](https://smartbear.com/solutions/microservices/)

> focus on building single-function modules with well-defined interfaces and operations

### From [Rachel Reese](https://www.codemag.com/Article/1611071/Case-Study-Writing-Microservices-with-F)

She mentions that there are the following guidelines around such services:

- Being able to rewrite each service in fewer than six weeks
- Using DDD, wherein there should be one service per bounded context
- That each microservice has fewer than 300 lines of code
- That each microservice is a single function

She then mentions Jet.com's guidelines:

- It’s a short script file with well-defined inputs and outputs.
- It should be an application of the Single Responsibility Principle, applied at the service level.

## The future of microservices

We can expect there to be different types of standardization efforts of microservices solutions. The definition of a service and microservice has deep meaning for the type of solution you can realize. Different people will sell their view of what it is and tell you that "you are doing it wrong" in order to sell consulting/tools/hosting et.c..

My personal view is that you should *decide for yourself* what you think a microservice is.

Some sources have bigger influence than others in certain contexts, that means that different definitions can be considered decided more correct depending on the company.
