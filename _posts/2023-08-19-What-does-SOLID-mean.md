---
layout: post
title: What does SOLID mean
date: 2023-08-19T13:32:45+03:00
---

## Sources

- [Dan North: Why Every Element of SOLID is Wrong](https://speakerdeck.com/tastapod/why-every-element-of-solid-is-wrong)
- [Wikipedia](https://en.wikipedia.org/wiki/SOLID#SOLID_Principles)
- [SOLID for functional programming](https://stackoverflow.com/questions/5577054/solid-for-functional-programming)
- [Equivalent of SOLID principles for functional programming](https://softwareengineering.stackexchange.com/questions/165356/equivalent-of-solid-principles-for-functional-programming)

## Principles

### Single responsibility principle

Let us start with [The single responsibility principle](https://blog.cleancoder.com/uncle-bob/2014/05/08/SingleReponsibilityPrinciple.html):

> “We have tried to demonstrate by these examples that it is almost always incorrect to begin the decomposition of a system into modules on the basis of a flowchart. We propose instead that one begins with a list of difficult design decisions or design decisions which are likely to change. Each module is then designed to hide such a decision from the others.”

some see it as:

> do one thing and do it well

The problem with this principle is that the definition is open for interpretation. The principle assumes sufficient experience around what kind of changes in requirements we can expect (something that depends on the people involved). I've worked with people that have a good grasp on how large a class/module or function should be, but the problem is that people have different expectations around what kind responsibility/concern code should have. It is a good thing to keep code focused on one thing, so the principle should be more of a reminder to break out or move code that does not fit. As [Marco Cecconi in 'I don't love the single responsibility principle'](https://sklivvz.com/posts/i-dont-love-the-single-responsibility-principle) mentions, to avoid making a mess you need balance coupling and cohesion (not something you would expect a developer that has only worked for a few years to know). It can still be good to have it in mind.

### Open-Closed principle

> Software entities ... should be open for extension, but closed for modification.

Mentioned in [The Open-Closed Principle](https://web.archive.org/web/20060822033314/http://www.objectmentor.com/resources/articles/ocp.pdf)
Another principle that you need to have experience in order to apply in a good way. The risk is that it becomes as Dan North says

> Cruft Accretion Principle

I don't agree with Dan North. If you have smaller code blocks as mentioned in single responsibility principle you can garbage collect old code.

Perhaps some of the issues around this principle is that it becomes overly ambitious scope if taken out of context. If we pull back on the ambition and instead focus on some of the things he talks about in the article we can summarize as following:

The reason for the principle is that you want to avoid cascade of changes due to a single change of one code unit. That is

> Allowing you to change behaviors without modifying code

An example is given how it is brittle to write code that uses "runtime type identification". Why is that brittle?  The reason it is brittle is because if you have a class that is not `sealed` in C# or `final` in Java or C++, someone can easily inherit and break old assumptions.

My take on the case of OCP is that you either make code:

- closed: i.e. make sure that you cannot inherit by making the class sealed/final having an algebraic datatype
- open: open for inheritance but have property/method to the class/type so that the you force child classes to take a decision

My feeling is that this principle makes most sense when talking about

- Clear single responsibility principle violations
- Inheritance in your business code. Many developers follow [Composition over inheritance](https://en.wikipedia.org/wiki/Composition_over_inheritance) why you do not need to worry about open and closed in relation to inheritance in such code bases.
- When you are developing framework/infrastructure code. It makes more sense to freeze framework/infrastructure behavior than it does to freeze business behavior (since businesses and people change).

### Liskov substitution principle

The [Liskov substitution principle](https://en.wikipedia.org/wiki/Liskov_substitution_principle) is not formulated mostly by Uncle Bob, why it has a slightly different feel to it.

> An implementation of an abstraction should be replaceable with other implementations of the same abstraction

or formulated in a different way

> Code unit that publishes conformance to contract should conform to the contract

[IReadOnlyCollection](https://learn.microsoft.com/en-us/dotnet/api/system.collections.generic.ireadonlycollection-1?view=net-7.0#definition) suffers from a violation of Liskov principle as can be seen on [Stackoverflow: ReadOnlyCollection vs Liskov](https://stackoverflow.com/questions/13819058/readonlycollection-vs-liskov-how-to-correctly-model-immutable-representations).

We note that IReadOnlyCollection is more about what Dan North says:

> acts-like-a, can-be-used-as-a

That is, if we send in a list to a method that accepts a read-only collection then we assume that the method wont mutate the list and the method assumes that we won't mutate that list (during the execution of the method). This means that we are back at a more fuzzy interpretation rather than a strict principle. My feeling is that even though it is benign to let lists act like readonly, you are opening yourself up to trouble in the long run.

### Interface segregation principle

From [object mentor article ISP](https://docs.google.com/a/cleancoder.com/viewer?a=v&pid=explorer&chrome=true&srcid=0BwhCYaYDn8EgOTViYjJhYzMtMzYxMC00MzFjLWJjMzYtOGJiMDc5N2JkYmJi&hl=en).

> Clients should not be forced to depend upon interfaces that they do not use.

The intention of this principle is that you should not require your code to depends on "fat" interfaces (or collection of unrelated interfaces).

- Having to implement more methods requires more work. Introduces unnecessary work.
- It is harder to know what parts of a larger interface is relevant to mock/fake when you are doing unit testing. Having smaller interfaces simplifies testing.

The problem with this principle is that there isn't a sufficiently clear definition of when to apply this principle. In many cases depending on C# `ICollection<>` is better instead of a specialized interface with only the methods that you use. You rarely implement your own collections, rather you usually depend on existing framework implemented collections. If you instead try to limit this principle to business code (instead of infrastructure) you can end up with infrastructure code that makes your code hard to test when there isn't any provided testing tools for the infrastructure.

### Dependency inversion principle

From [object mentor article DIP](https://web.archive.org/web/20110714224327/http://www.objectmentor.com/resources/articles/dip.pdf):

> modules that encapsulate high level policy should not depend upon modules that implement details. Rather, both kinds of modules should depend upon abstractions.

Why? My feeling is that he describes a situation with a solution with a mix of business logic and low level implementation logic. It could also be that this principle makes most sense if you try to use ports and [adapters/hexagonal/clean architecture](https://blog.ploeh.dk/2016/03/18/functional-architecture-is-ports-and-adapters/).

If we are talking about two different things such as high level modules or detail being business code and low level modules being databases, integrations and hardware implementation. If we code directly against a specific database/integration/x86 architecture then we know that the code is less portable. Having infrastructure interfaces that includes business details means that the infrastructure is tied to that business domain. That is generally fine for solutions that only caters to one business domain but not fine for general purpose code such as say Entity Framework or Spring.

We should not design for reuse in our business domain, but rather if we are building software that is intended for many business domains. This means that by misunderstanding this principle it can lead you into writing "reusable" code that should never be reused.

## Conclusion

My feeling is that SOLID makes sense. It does however require you to have worked as a software developer/engineer enough in order to get the experience needed to understand them. I've talked with coworkers that have seen the failure mode of teams trying to apply the principles in a mechanical fashion.
