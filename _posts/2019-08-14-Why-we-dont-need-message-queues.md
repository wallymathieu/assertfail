---
layout: post
title: Why we don't need message queues
date: 2019-08-14T11:02:01+02:00
---

If the system you are developing is intended to be delivered by a single team (or a single backend team), there might be less need for a decomposed solution. This also applies if you are starting out on something relatively small and don't have the operations setup for doing micro services.

If you still will want to structure your code in separate parts with clear API boundries between them you can define request/response, publish:

```c#
    /// <summary>
    /// Defines a mediator to encapsulate request/response and publishing interaction patterns
    /// </summary>
    public interface IMediator
    {
        /// <summary>
        /// Asynchronously send a request to a single handler
        /// </summary>
        /// <typeparam name="TResponse">Response type</typeparam>
        /// <param name="request">Request object</param>
        /// <param name="cancellationToken">Optional cancellation token</param>
        /// <returns>A task that represents the send operation. The task result contains the handler response</returns>
        Task<TResponse> Send<TResponse>(IRequest<TResponse> request, CancellationToken cancellationToken = default);

        /// <summary>
        /// Asynchronously send a notification to multiple handlers
        /// </summary>
        /// <param name="notification">Notification object</param>
        /// <param name="cancellationToken">Optional cancellation token</param>
        /// <returns>A task that represents the publish operation.</returns>
        Task Publish<TNotification>(TNotification notification, CancellationToken cancellationToken = default)
            where TNotification : INotification;
    }
```

The above interface is from the [MediatR](https://github.com/jbogard/MediatR) framework, but should be fairly trivial to implement on your own.

How would you wire up such a solution?

- In [SimplCommerce](https://github.com/simplcommerce/SimplCommerce) they use `TryLoadModuleAssembly` or `Assembly.Load`
- In for instance [Jenkins](https://jenkins.io/) you have the ability to write [plugins](https://wiki.jenkins.io/display/JENKINS/Plugin+tutorial).
- [MEF](https://docs.microsoft.com/en-us/dotnet/framework/mef/) is used by Lucene.net in order to create docs plugins
