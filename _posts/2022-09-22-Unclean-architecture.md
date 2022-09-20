---
layout: post
title: Unclean architecture
date: 2022-09-22T07:08:43+02:00
---

## Clean architecture

From what I understand of [Clean architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) it's an iteration of [Hexagonal architecture](https://en.wikipedia.org/wiki/Hexagonal_architecture_(software)) also known as Ports and Adapters (see the Wikipedia page).

### Sample code

A sample succinct implementation is the
[F# : Onion architecture in a nutshell](https://gist.github.com/akhansari/d4c5a219d22199f151016639e5aa8d8a). You could [translate that into Typescript](https://gist.github.com/wallymathieu/68b14bcd3e45c4c5b040b60c558a5318#file-onion_1-ts
).
### Clean code and way of working / method

You also get into the question around how do you work?

- Use of known working patterns : restrict what you do to only the known working units
- Use of only parts that person X understands. Limit to known working units known by a single person. I've heard the reasoning that this means that there is a possibility that other people can grasp the solution fully since there is no need for specialized knowledge held by subset of workers
- Keep the solution in your head, execute the code in your mind : use logical reasoning

- Manual testing of business logic : manual test: verify that for some input and flows, the solution work
- Manual testing with a debugger in order to verify that it works as intended, find where it does not
- Automatic tests: program executes the tests: same as manual test, but due to lower cost can usually cover more cases

A somewhat clean architecture can help with manual testing since you can verify otherwise expensive conditions (deployed faked services in order to avoid real solutions).

How does this compare to the [scientific method](https://en.wikipedia.org/wiki/Scientific_method)?

- Automatic/manual testing is a way to verify behavior of some code given some known state.
- A known working pattern in programming could perhaps be seen as a hypothesis that has been proven to work for some use cases.
- The use of logical reasoning seems very much connected to the scientific method.

How does this compare to [craftsmanship](https://en.wikipedia.org/wiki/Software_craftsmanship)?

> If we have learned anything over the last couple of decades, it is that programming is a craft more than it is a science. To write clean code, you must first write dirty code and then clean it.

*C., Martin Robert. Clean Code (pp. 417-418). Pearson Education. Kindle Edition.*

I think that what he means is that programming is communication at its core essence. It is not only about being able to verify that the system works by writing tests, proofs and use known components. It is fully possible to write working code that no one can read without spending significant effort ([Brainfuck](https://en.wikipedia.org/wiki/Brainfuck), [Malbolge](https://en.wikipedia.org/wiki/Malbolge) et.c. being prime examples of languages, but can be achieved in regular programming languages in several ways).

The point I'm trying to give you is that its a combination of making meaningful code and working code at the same time. You have a highly formalized syntax and usually many common patterns to work with (that you assume that people will understand). Even if you argue that it is a craft, I would still argue for the need to use formal methods to support that craft (since it's a combination).


### Clean architecture use of OO and code dependency

> OO is the ability, through the use of polymorphism, to gain absolute control over every source code dependency in the system. It allows the architect to create a plugin architecture, in which modules that contain high-level policies are independent of modules that contain low-level details. The low-level details are relegated to plugin modules that can be deployed and developed independently from the modules that contain high-level policies.

*Martin, Robert C. . Clean Architecture (Robert C. Martin Series) (p. 47). Pearson Education. Kindle Edition.*

As we have seen around functional programming there are [many ways of dealing with dependencies](https://fsharpforfunandprofit.com/posts/dependencies/).

### Compare to pure impure

Compare [Impureim sandwich](https://blog.ploeh.dk/2020/03/02/impureim-sandwich/) with the hexagonal/clean/ports and adapters architecture

The question then is if the domain is supposed to be free from external code so that you have only code that you yourself understand or if it's supposed to only be code without external IO/side-effects?

A clean as in pure functional domain without IO will be:

- Testable
- Independent of DB, external agency, UI

In the same way as a clean architecture. There might be implicit dependency on DB, UI et.c. due to features or flows that implies such. We even have Mark Seemann argue that [functional architecture is Ports and Adapters](https://blog.ploeh.dk/2016/03/18/functional-architecture-is-ports-and-adapters/).

## Unclean architecture

It's nice to have a clean architecture. Though as Uncle Bob says, there is a cost. Some people have argued against these parts. You then arrive at another important architecture pattern that we can call the Unclean/untidy architecture (it's not totally dirty but not clean as well, I'm unsure if to call it unwashed or unkempt):

- Dependent on some Frameworks
- Dependent on some Database
- Dependent on some external agency
- Somewhat Testable

The most important such architecture must be Rails since you write code that is very dependent on framework (Rails), dependent on that there is a SQL-database. As long as you keep it somewhat tidy you can test using sqlite locally and integration test your controllers. You can configure your app to spin up a local db and test against that (even the same type of DB that you use in prod).

[DHH argues](https://dhh.dk/2014/test-induced-design-damage.html) there are too many downsides of using such an architecture.

As long as you keep your app relatively small, this can be quite OK. For larger solutions, you start feeling the pain. Your milage may vary.

Another way of writing unclean applications is to use a [thin API wrapper around SQL](http://assertfail.gewalli.se/2022/04/03/small-and-simple-business-applications-using-sql.html). This style of untidy architecture can work well in some cases.

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

## Existence of clean code

There are people that argue that there is [no such thing as clean code](https://www.steveonstuff.com/2022/01/27/no-such-thing-as-clean-code).

The problem is that low level vs high level is not a clear enough concept.

It feels like what Robert Martin is trying to describe is the business domain code without other peoples code (except when you really trust it), without code for IO like http, file access et.c..

You could perhaps argue that when trying to come up with a clean architecture for Haskell then one way to define such a scheme could be to you isolate your business code from any IO (something quite feasible in Haskell). The benefit of using some of the functional programming concepts is that they at least have a formal definition that can be verified.

My guess is that the problem is that for many senior developers/programmers clean code is related to feelings of cleanliness, so will be apparent to programmers that have gotten a feeling for it (my guess being that you would teach that through literary workshops).

## Conclusion

Clean code/architecture probably suffer from what Eric Normand denotes [The Christopher Alexander Effect](https://ericnormand.me/podcast/the-christopher-alexander-effect): that the advice around clean architecture/code is almost obvious to some senior programmers while unhelpful for others.

In order to know when it's a good thing to accept an Unclean architecture, you want to have some ideas about what a Clean architecture is. I'm thinking [poetic license](https://en.wiktionary.org/wiki/poetic_licence) may apply for architecture as well. The main benefit of a somewhat unclean architecture is the reduced amount of code and ceremony (sometimes a very difficult choice to make).

FP concepts have come to have a broad influence over many mainstream core frameworks (see the functional concepts in [Java](https://www.baeldung.com/java-functional-programming) and [C#](https://en.wikipedia.org/wiki/Language_Integrated_Query) base libraries). We can argue that these concepts give us tools and definitions that help remove the fluff around the definitions.
