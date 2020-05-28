---
layout: post
title: Implicit versus explicit dependencies
date: 2020-05-28T18:30:50+02:00
tags: c# java core dotnet
---

Let us start out by asking the question, what is an explicit dependency in your software?

How should we define a dependency? The easiest way to define a dependency would be there is an explicit package reference to a library. If you can remove the explicit pacakge reference, does the code still work? In order to qualify the reasoning let us define it as a reference to library that with explicit usage of the library API.

How does explicit dependency look in Java?

```java
...
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
...

import java.util.concurrent.CompletableFuture;

@RestController()
public class CustomersController {
    @Autowired
    private Repository repository;
    @Autowired
    private CommandsHandler commandsHandler;
    @RequestMapping(value = "/api/customers/{id}", method = RequestMethod.GET)
    public ResponseEntity<Customer> get(@PathVariable int id) {
```

Here we see an explicit dependency on spring in order to implement a controller.

If you look at an example from C#:

```c#
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

In order to look for an example of a implicit dependency of code we could look at how different [ORM](https://en.wikipedia.org/wiki/Object-relational_mapping) works when using [POCO](https://en.wikipedia.org/wiki/Plain_old_CLR_object) or [POJO](https://en.wikipedia.org/wiki/Plain_old_Java_object). When you use a restricted amount of features from Entity Framework, your code will work with other frameworks. 

Since the behaviour of any ORM will necessitate that you follow the patterns and conventions assumed by the framework. For instance if you decide to use strongly typed keys, will these work in another ORM? Does your usage of inheritance work with another ORM? These small things tie subsets of your code implicitly to a specific library or framework.

Another example of implicit dependency is if you follow the advice of [Mark Seeman on composition root location](https://blog.ploeh.dk/2019/06/17/composition-root-location/), you could have used say one specific dependency injection framework only in your composition root. How could that tie your other code to that then? A specific implementation of a dependency injection framework will have sometimes subtle differences in how things are created when you resolve the code. You might have unintentionally created code that works when initialised in a particular way but will break when you switch to another framework. Microsoft has used [IServiceProvider](https://docs.microsoft.com/en-us/dotnet/api/system.iserviceprovider) as the least common denominator. 

Hickups could be:

- How are concrete classes resolved, do they need to be explicitly registered?
- What happens when you send an `typeof(IEnumerable<T>)` to `GetService` of `IServiceProvider`? Will the same thing happen for all implementations of IServiceProvider? The [assumption is that it should](https://github.com/aspnet/DependencyInjection/blob/af08243a95c61dcd2495066763344b0d59a3aa82/src/DI.Abstractions/ServiceProviderServiceExtensions.cs#L98-L118).
- What happens when you have multiple registrations of `T`?

if we look at the previous implementation of `GetRequiredService` (an extension of `IServiceProvider`) we note some interesting behaviour:

```c#
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

[from](https://github.com/aspnet/DependencyInjection/blob/af08243a95c61dcd2495066763344b0d59a3aa82/src/DI.Abstractions/ServiceProviderServiceExtensions.cs#L50-L54)

The implication is that different implementations of `IServiceProvider` can have different levels of compatibility with each other.

We see similar implications around logging frameworks. Say that you have wrapped the logging in your own API surface in order for your library logging to work. The API surface has grown to incorporate various features needed over the years (keeping it in tandem with the logging infrastructure). Say that the organisation behind the logging framework goes bust. How much work is it to adapt what is now a fairly large API surface in order to be able to still use old libraries? Since the interfaces you have defined match the features of the old logging infrastructure, you could have trouble adopting a new logging infrastructure (even though you have your own interfaces).

For instance, for libraries there are a couple of logging alternatives in the .net space:

- [Microsoft Extensions Logging](https://docs.microsoft.com/en-us/dotnet/api/microsoft.extensions.logging)
- [logary](https://github.com/logary/logary#using-logary-in-a-library)
- [FsLibLog](https://github.com/TheAngryByrd/FsLibLog)

Note that for C#, there is a defacto standard in the form of Microsoft Extensions Logging. The downside of this is that it can tie you to the major releases of .net core. I've seen that I've needed to revisit old libraries due to breaking changes in between major versions. This can be a minor thing or a big thing depending on the amount of library code you have (potentially creating problems with tight deadlines).

That's why preference when it comes to library logging is to choose the amount of dependencies you feel that you can handle. If you can get away with the following for logging:

```c#
using LogError = Action<string, Exception>;
using LogDebug = Action<string>;
```

you don't really need to worry too much about different future logging implementations. How you pass variables associated with logging can be a game changer for your monitoring operations.

## Value of explicit dependencies

The benefit of using a specific implementation is that you can leverage the particulars of that implementation.

The cost of standardisation is the loss of agility when there is value in being able to change implementations.

Having a lowest common interface also restricts possibilites. Having defined an interface you might tie your software to a specific implemenation implicitly.

## TLDR

If you want to hedge your bets use small abstractions and small interfaces in order to avoid coupling your code to a specific implementation.