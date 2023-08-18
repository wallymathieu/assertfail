---
layout: post
title: What does SOLID mean
date: 2023-08-17T13:32:45+03:00
---

## Sources

- [Dan North: Why Every Element of SOLID is Wrong](https://speakerdeck.com/tastapod/why-every-element-of-solid-is-wrong)
- [Wikipedia](https://en.wikipedia.org/wiki/SOLID#SOLID_Principles)

## Single responsibility principle

Let us start with [The single responsibility principle](https://blog.cleancoder.com/uncle-bob/2014/05/08/SingleReponsibilityPrinciple.html):

> “We have tried to demonstrate by these examples that it is almost always incorrect to begin the decomposition of a system into modules on the basis of a flowchart. We propose instead that one begins with a list of difficult design decisions or design decisions which are likely to change. Each module is then designed to hide such a decision from the others.”

The problem with this principle is that the definition is open for interpretation. The principle assumes sufficient experience around what kind of changes in requirements we can expect (something that depends on the people involved). I've worked with people that have a good grasp on how large a class/module or function should be, but the problem is that people have different expectations around what kind responsibility/concern code should have. It is a good thing to keep code focused on one thing, so the principle should be more of a reminder to break out or move code that does not fit. As [Marco Cecconi in 'I don't love the single responsibility principle'](https://sklivvz.com/posts/i-dont-love-the-single-responsibility-principle) mentions, to avoid making a mess you need balance coupling and cohesion (not something you would expect a developer that has only worked for a few years to know).

## Open-Closed principle

Mentioned in [The Open-Closed Principle](https://web.archive.org/web/20060822033314/http://www.objectmentor.com/resources/articles/ocp.pdf)
Another principle that you need to have experience in order to apply in a good way. The risk is that it becomes as Dan North says

> Cruft Accretion Principle

This is due to the principle having an overly ambitious scope.

If we pull back on the ambition and instead focus on some of the things he talks about in the article we can summarize as following:

The reason for the principle is that you want to avoid cascade of changes due to a single change of one code unit.

An example is given how it is brittle to write code that uses "runtime type identification". Why is that brittle?  The reason it is brittle is because if you have a class that is not `sealed` in C# or `final` in Java or C++, someone can easily inherit and break old assumptions.

My take on the case of OCP is that you either make code:

- closed: i.e. make sure that you cannot inherit by making the class sealed/final having an algebraic datatype
- open: open for inheritance but have property/method to the class/type so that the you force child classes to take a decision

My feeling is that this principle makes most sense when talking about inheritance in your business code or when you are developing framework/infrastructure code. Many developers follow [Composition over inheritance](https://en.wikipedia.org/wiki/Composition_over_inheritance).

## Liskov substitution principle

The [Liskov substitution principle](https://en.wikipedia.org/wiki/Liskov_substitution_principle) is not formulated mostly by Uncle Bob, why it has a slightly different feel to it.

> An implementation of an abstraction should be replaceable with other implementations of the same abstraction

or formulated in a different way

> Code unit that publishes conformance to contract should conform to the contract

If you have an C# interface that is documented as:

> Represents a strongly-typed, read-only collection of elements

From [IReadOnlyCollection](https://learn.microsoft.com/en-us/dotnet/api/system.collections.generic.ireadonlycollection-1?view=net-7.0#definition)

Then the contract implies that you cannot mutate the collection. It would be reasonable to assume that any class that inherits from the interface is read-only. Looking at the list of types that does implement the interface we find for instance List, Queue, Stack. This means that the read only collection interface is more of a suggestion than a real contract (that it does not follow this principle).

We note that IReadOnlyCollection is more about what Dan North says:

> acts-like-a, can-be-used-as-a

That is, if we send in a list to a method that accepts a read-only collection then we assume that the method wont mutate the list and the method assumes that we won't mutate that list (during the execution of the method). This means that we are back at a more fuzzy interpretation rather than a strict principle.

## Interface segregation principle

From [object mentor article ISP](https://docs.google.com/a/cleancoder.com/viewer?a=v&pid=explorer&chrome=true&srcid=0BwhCYaYDn8EgOTViYjJhYzMtMzYxMC00MzFjLWJjMzYtOGJiMDc5N2JkYmJi&hl=en).

Specifying the smallest set of data or least specific interface required by a function is good practice.

## Dependency inversion principle

From [object mentor article DIP](https://web.archive.org/web/20110714224327/http://www.objectmentor.com/resources/articles/dip.pdf):

> - A. HIGH LEVEL MODULES SHOULD NOT DEPEND UPON LOW LEVEL MODULES. BOTH SHOULD DEPEND UPON ABSTRACTIONS.
> - B. ABSTRACTIONS SHOULD NOT DEPEND UPON DETAILS. DETAILS SHOULD DEPEND UPON ABSTRACTIONS.

Formulating the principle in this high handed way without having the context of what he means with high level and low level modules and abstraction and detail makes it hard to understand what he means.

If we are talking about two different things such as high level modules or detail being business code and low level modules being databases, integrations and hardware implementation. If we code directly against a specific database/integration/x86 architecture then we know that the code is less portable. Having infrastructure interfaces that includes business details means that the infrastructure is tied to that business domain. That is generally fine for solutions that only caters to one business domain but not fine for general purpose code such as say Entity Framework or Spring.

We should not design for reuse in our business domain, but rather if we are building software that is intended for many business domains. This means that this principle can lead you into writing "reusable" code that is never reused.
