---
layout: post
title: Validation and mediator
date: 2022-03-13T12:59:41+01:00
tags:
---

This example is loosely based on how the API looks for aggregates in [Axon Framework](https://docs.axoniq.io/reference-guide/axon-framework/axon-framework-commands/modeling/aggregate).

We also base some of the code around examples of `ValidationBehavior` found online.

- [Stackoverflow](https://stackoverflow.com/questions/42283011/add-validation-to-a-mediatr-behavior-pipeline)
- [CodeMaze](https://code-maze.com/cqrs-mediatr-fluentvalidation/)

The reason why I've implemented these examples is in order to showcase how you can cut down on some of the ceremony around using a generic mediator interface implementation together with fluent validation logic (pipeline behavior in MediatR parlance).

Note that I'm not making a value judgement around [if you should use MediatR or not](https://cezarypiatek.github.io/post/why-i-dont-use-mediatr-for-cqrs/), [if you should use AOP or not](https://en.wikipedia.org/wiki/Aspect-oriented_programming#Criticism).

## Assumptions

We assume that we want to use some validation API (here we use FluentValidation).

We assume that the domain have most of the business code in the entities.

We assume that we want to use MediatR (you could substitute MediatR with a message queue abstraction).

We assume that we use some sort of unit of work (if we use EF Core that would be DbContext, while it would be session if we use NHibernate).

## STEP 1

First step is to create the classes that will implement the MediatR IRequestHandler:

- `FuncCreateCommandHandler`
- `FuncMutateCommandHandler`

You could implement these classes in the following way:

```C#
    class FuncMutateCommandHandler<TEntity, TCommand, TResponse> : IRequestHandler<TCommand, TResponse>
        where TCommand : ICommand<TResponse> where TEntity : IEntity
    {
        private readonly Func<TEntity, TCommand, IServiceProvider, TResponse> _func;
        private readonly IServiceProvider _serviceProvider;

        public FuncMutateCommandHandler(Func<TEntity, TCommand, IServiceProvider, TResponse> func, IServiceProvider serviceProvider)
        {
            _func = func;
            _serviceProvider = serviceProvider;
        }

        public async Task<TResponse> Handle(TCommand cmd, CancellationToken cancellationToken)
        {
            var repository = _serviceProvider.GetRequiredService<IRepository<TEntity>>();
            var keyValueFactory = _serviceProvider.GetRequiredService<IKeyValueFactory<TCommand>>();
            var entity = await repository.FindAsync(keyValueFactory.Key(cmd));

            var r = _func(entity, cmd, _serviceProvider);

            return r;
        }
    }

```

See [FuncMutateCommandHandler](https://github.com/wallymathieu/validation-studies/blob/26d8dde728a1fba01edd007f81a349f8717a36da/src/CsMediatR/Infrastructure/CommandHandlers/ApiRegistrationsExtensions/FuncMutateCommandHandler.cs)

Note that the signature of the delegate is:
`Func<TEntity, TCommand, IServiceProvider, TResponse>`

The base responsibility for these classes will be to retrieve and store the business entities as well as provide an opportunity to inject validation logic (since we implement a generic interface).

Since they take a func it's trivial to create a fluent API in order to register how the entities :

[Given_fluent_registration_of_handlers](https://github.com/wallymathieu/validation-studies/blob/ba74e2cb1128b080282e75071c86720870b617fd/src/CsMediatR/Given_fluent_registration_of_handlers.cs)

The setup then becomes the description of how we tie together the business entities (Person).

```C#
        services.RegisterHandlersFor<Person>()
            .UpdateCommandOnEntity<EditPersonCommand,Person>((entity, cmd, svc) => entity.Handle(cmd, svc))
            .CreateCommandOnEntity<CreatePersonCommand>(Person.Create)
```

## STEP 2

Since we have the initial classes needed to write automatically created registrations based on attributes we can now create our first such implementation.

We note that what we need to achieve is to write code that registers the above handlers. Since we want to be efficient we write a Linq Expression that essentially does:

```C#
    new FuncMutateCommandHandler<TEntity,TCommand,TResult>((entity, cmd, svcProvider) =>
        entity.`MethodInfo`(cmd, svcProvider), outerSvdProvider)
```

This code is not too difficult to write. See [the implementation](https://github.com/wallymathieu/validation-studies/blob/master/src/CsMediatR/Infrastructure/CommandHandlers/ApiRegistrationsExtensions.cs#L228-L250).

## Resoning 1-2

We have a solution that deals with `IServiceProvider` and a lambda. Since given a service provider we can always get a service, this essentially means that we have the needed building blocks to adjust the solution into taking multiple services.

## Step 3

Since we have the building blocks we need to find places where we have registrations that matches the pattern:

```C#
    [CommandHandler]
    public ... Handle(EditBookingCommand cmd, IAService services, ...) ...
```

In order to find such we can write some simple reflection based code (in the example we scan for instance methods that does not take service provider as a parameter).

Then the heavy lifting is to write an expression that does:

```C#
    new FuncMutateCommandHandler<TEntity,TCommand, TResult>((entity, cmd, svcProvider) => entity.`MethodInfo`(cmd,
        svcProvider.GetRequiredService<IAService>()
        ), outersvcProvider)
```

See [the implementation](https://github.com/wallymathieu/validation-studies/blob/master/src/CsMediatR/Infrastructure/CommandHandlers/ApiRegistrationsExtensions.cs#L177-L211).

## Conclusion

I've talked to some coworkers that have expressed a feeling that there is too much magic going on with a decomposed solution that uses generic interfaces. This is similar to the criticism around AOP.

We have around 400 lines of infrastructure glue code to tie the code together. The main difficulty in the implementation is around writing Linq Expressions. The reflection code can be seen as similar to how you would write queries against a database, so might not be so far fetched. The Linq Expression code is somewhat abstract, that might be more difficult to understand.

If you want to write C# such that you find MediatR useful, then the complexity could be hidden as library or framework code. You cut down on a lot of copy paste and ceremony for implementing command handlers.
