---
layout: post
title: Unclean architecture
date: 2022-09-22T07:08:43+02:00
---

This post is a continuation of [Small and simple business applications using SQL](https://assertfail.gewalli.se/2022/04/03/small-and-simple-business-applications-using-sql.html).

## Clean architecture

From what I understand of [Clean architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) it's an iteration of [Hexagonal architecture](https://en.wikipedia.org/wiki/Hexagonal_architecture_(software)) also known as Ports and Adapters (see the Wikipedia page).

Why would you want architecture? The main purpose is to deliver a working solution to the customer. How do you arrive to that? Architecture is a tool that enables developers to reason about how the system works.

### Sample code

A sample succinct implementation is the
[F# : Onion architecture in a nutshell](https://gist.github.com/akhansari/d4c5a219d22199f151016639e5aa8d8a). You could [translate that into Typescript](https://gist.github.com/wallymathieu/68b14bcd3e45c4c5b040b60c558a5318#file-onion_1-ts
).

## Unclean architecture

It's nice to have a clean architecture. Though as Uncle Bob says, there is a cost. Some people have argued against these parts. You then arrive at another important architecture pattern that we can call the Unclean/untidy architecture (it's not totally dirty but not clean as well, I'm unsure if to call it unwashed or unkempt):

- Dependent on some Frameworks
- Dependent on some Database
- Dependent on some external agency
- Somewhat Testable

The most important such architecture must be Rails since you write code that is very dependent on framework (Rails), dependent on that there is a SQL-database. As long as you keep it somewhat tidy you can test using sqlite locally and integration test your controllers. You can configure your app to spin up a local db and test against that (even the same type of DB that you use in prod).

[DHH argues](https://dhh.dk/2014/test-induced-design-damage.html) there are too many downsides of using such an architecture.

As long as you keep your app relatively small, this can be quite OK. For larger solutions, you start feeling the pain. Your milage may vary.

Another way of writing unclean applications is to use a [thin API wrapper around SQL](https://assertfail.gewalli.se/2022/04/03/small-and-simple-business-applications-using-sql.html). This style of untidy architecture can work well in some cases.

An example of small dirty app is to write a small service that does a mix of external and internal calls in order to have an app that can be in something like a smallish program wrapped by a docker container. The idea is that having an explicit dependency on one specific DB and no safety net does not matter as long as it's easy enough to recreate a development experience using containers.

### Accepting grime or dust

When is it a good idea? Even Uncle Bob says that:

> There are some frameworks that you simply must marry.

*Martin, Robert C. . Clean Architecture (Robert C. Martin Series) (p. 295). Pearson Education. Kindle Edition.*

Do you consider Rails, EF core as frameworks you wed? As long as the app is still testable with an in memory db using EF core, can it still be considered clean (as long as it follows the other parts)?

What does it mean to have a totally clean architecture? Is the concept of clean architecture easier to communicate than:

- in order to test you need to have a very custom SQL database up and running (something like backup and restore of an existing DB)
- in order to compile the code you need to have several libraries installed on your machine (globally installed) and installed in a very specific order
- in order to run the code you need to have specific versions of a couple of programs installed in specific locations
- any triggering of payments, causes real invoices to be sent to real business and inventory to be updated

I think such a solution is harder (in some sense) to work on.

The main benefit of using a dependency directly trickles down to the advantage we get from being able to swap out the dependency (in tests and business code). If a dependency has a complicated contract hard to capture using a simple fake. An example is when the behavior of [ORM](https://en.wikipedia.org/wiki/Object–relational_mapping) creates an implicit dependency on using the real thing to verify your business logic. It's sort of like a [cohabitation relationship](https://sv.wikipedia.org/wiki/Samboförhållande). You are not married, but the practical difference might be minor.

## Conclusion

Clean code/architecture probably suffer from what Eric Normand denotes [The Christopher Alexander Effect](https://ericnormand.me/podcast/the-christopher-alexander-effect): that the advice around clean architecture/code is almost obvious to some senior programmers while unhelpful for others.

In order to know when it's a good thing to accept an Unclean architecture, you want to have some ideas about what a Clean architecture is. I'm thinking [poetic license](https://en.wiktionary.org/wiki/poetic_licence) may apply for architecture as well. The main benefit of a somewhat unclean architecture is the reduced amount of code and ceremony (sometimes a very difficult choice to make).
