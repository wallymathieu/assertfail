---
layout: post
title: Implicit versus explicit dependencies
date: 2020-05-28T18:30:50+02:00
tags: C# core dotnet
comments:
  - author: Oskar Gewalli
    content: An implicit dependency in our POCO models on EF core 2 was that we assumed that EF core would create non null owned properties, while in EF core 3 that [behavior has changed](https://docs.microsoft.com/en-us/archive/msdn-magazine/2019/november/data-points-backing-field-and-owned-entity-changes-in-ef-core-3-0).
    date: 2020-06-01T10:15:35+01:00
  - author: Oskar Gewalli
    content: Changed the minimal logging abstraction to match a structured logging approach since the current logging providers support it. The standard [messagetemplates](https://messagetemplates.org/) is used and implemented in various libraries such as [messagetemplates F#](https://github.com/messagetemplates/messagetemplates-fsharp).
    date: 2020-06-12T15:55:35+01:00

---

These are musings related to the question what kind of libraries resist the test of time. Some of it is related to issues encountered due to [Dependency Hell](https://en.wikipedia.org/wiki/Dependency_hell).

## Explicit dependency

Let us start out by asking the question, what is an explicit dependency in your software?

How should we define a dependency? The easiest way to define a dependency would be there is an explicit package reference to a library. If you can remove the package reference, does the code still work? In order to make it clear, let us define it as a reference to a library and explicit usage of the library API.

How does such an explicit dependency look in C#:

```C#
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
...
    public class BusinessDbContext : IdentityDbContext<ApplicationUser>
    {
        public BusinessDbContext(DbContextOptions options) : base(options)
        {
        }

        public DbSet<Customer> Customers { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<Product> Products { get; set; }
    }
```

The businessDbContext class is implemented using EF core. There is an explicit dependency on Entity Framework in this case.

### Value of explicit dependencies

The benefit of using a specific implementation is that you can leverage the particulars of that implementation.

The cost of standardisation is the loss of agility when there is value in being able to change implementations.

## Implicit dependency

In order to look for an example of a implicit dependency of code we could look at how different [ORM](https://en.wikipedia.org/wiki/Object-relational_mapping) works when using [POCO](https://en.wikipedia.org/wiki/Plain_old_CLR_object) or [POJO](https://en.wikipedia.org/wiki/Plain_old_Java_object). When you use a restricted amount of features from Entity Framework, your code will work with other frameworks.

Since the behavior of any ORM will necessitate that you follow the patterns and conventions assumed by the framework. For instance if you decide to use strongly typed keys, will these work in another ORM? Does your usage of inheritance work with another ORM? These small things tie subsets of your code implicitly to a specific library or framework.

Another example of implicit dependency is if you follow the advice of [Mark Seeman on composition root location](https://blog.ploeh.dk/2019/06/17/composition-root-location/), you could have used say one specific dependency injection framework only in your composition root. How could that tie your other code to that then? A specific implementation of a dependency injection framework will have sometimes subtle differences in how things are created when you resolve the code. You might have unintentionally created code that works when initialized in a particular way but will break when you switch to another framework. Microsoft has used [IServiceProvider](https://docs.microsoft.com/en-us/dotnet/api/system.iserviceprovider) as the least common denominator.

Hiccups could be:

- How are concrete classes resolved, do they need to be explicitly registered?
- What happens when you send an `typeof(IEnumerable<T>)` to `GetService` of `IServiceProvider`? Will the same thing happen for all implementations of IServiceProvider? The [assumption is that it should](https://github.com/aspnet/DependencyInjection/blob/af08243a95c61dcd2495066763344b0d59a3aa82/src/DI.Abstractions/ServiceProviderServiceExtensions.cs#L98-L118).
- What happens when you have multiple registrations of `T`?

if we look at the previous implementation of [`GetRequiredService`](https://github.com/aspnet/DependencyInjection/blob/af08243a95c61dcd2495066763344b0d59a3aa82/src/DI.Abstractions/ServiceProviderServiceExtensions.cs#L50-L54) (an extension of `IServiceProvider`) we note some interesting behavior:

```C#
public static object GetRequiredService(this IServiceProvider provider, Type serviceType)
{
    ...
    var requiredServiceSupportingProvider = provider as ISupportRequiredService;
    if (requiredServiceSupportingProvider != null)
    {
        return requiredServiceSupportingProvider.GetRequiredService(serviceType);
    }

    var service = provider.GetService(serviceType);
    ...
```

The implication is that different implementations of `IServiceProvider` can have different levels of compatibility with each other.

If your library can avoid a dependency injection framework and instead present a simple API for consumers of the library, it will make it more resilient against future changes. If your target audience is C# enterprise applications, then Microsoft Extensions Dependency Injection could be currently standard enough. That's at least a decision that was made for libraries at Carable. This turned out that we needed to upgrade some libraries due to breaking changes between major versions.

We see similar implications around logging frameworks. Say that you have wrapped the logging in your own API surface in order for your library logging to work. The API surface has grown to incorporate various features needed over the years (keeping it in tandem with the logging infrastructure). Say that the organization behind the logging framework goes bust. How much work is it to adapt what is now a fairly large API surface in order to be able to still use old libraries? Since the interfaces you have defined match the features of the old logging infrastructure, you could have trouble adopting a new logging infrastructure (even though you have your own interfaces).

### Fleeting standards

Any organization will take a look at the libraries they maintain and consider if it's worth the effort of maintaining them. Microsoft is no exception. While we see Microsoft backing, some of the libraries get a huge boon. Question is what happens in 10-15 years? Will there be a new iteration of software in order to deal with the competition from other ecosystems?

I've seen standardizations on logging for .net come and go. In the early parts of my career Log4Net was good enough and useful enough that it made sense to standardize on that. The latest thing I've seen is standardizations on SeriLog and Microsoft Extensions Logging (in various mixtures).

For instance, for libraries there are a couple of logging alternatives in the .net space:

- [Microsoft Extensions Logging](https://docs.microsoft.com/en-us/dotnet/api/microsoft.extensions.logging)
- [logary](https://github.com/logary/logary#using-logary-in-a-library)
- [FsLibLog](https://github.com/TheAngryByrd/FsLibLog)

Note that for C#, there is a defacto standard in the form of Microsoft Extensions Logging. For the transition between major versions 1 and 2 there was some breaking changes. For the current iterations 2 to 3 I've not seen any breaking changes (around logging). Instead I've seen (for internal libraries at work) that for the iteration 2 to 3 EF Core has been source compatible but binary incompatible. This has meant that we had to keep the internal libraries in lockstep.

If you want to avoid having to upgrade everything at once and instead want to take it gradually, you probably want to avoid coupling your library to a major version of a common library causing dependency issues.

That's why preference when it comes to for example library logging to choose the amount of dependencies you feel that you can handle. If you can get away with something like the following for logging:

```C#
using LogError = Action<string, Exception, object[]>;
using LogDebug = Action<string, object[]>;
```

You don't really need to worry too much about different future implementations. The above definition might not be enough for your needs (why a larger abstraction is warranted).

## Leaky abstractions

Leaky abstractions are somewhat related to implicit dependencies in that the abstractions still cause tight coupling to specific implementations.

### Dangers

Having a lowest common interface restricts possibilities. Having defined an interface you might tie your software to a specific implementation implicitly (making you pay for the abstraction without giving you ability to swap out implementation).

### Value

In order to decompose a much larger system into smaller parts in order to let people focus on subsets, having boundaries can be helpful. You might not be able to easily swap out the implementation of a complicated part of your system. Letting people ignore a lot of the implementation details can still provide value even though it might be a leaky abstraction.

## TLDR

If you want to hedge your bets (in order to be able to swap out small parts) use small abstractions and small interfaces in order to avoid coupling your code to a specific implementations (when there is a reason for it). Taking as few dependencies as possible is usually the best thing for any library, since it helps making it more resilient against other libraries using different versions of the dependency.
