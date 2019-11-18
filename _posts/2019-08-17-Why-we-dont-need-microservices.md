---
layout: post
title: Why we don't need microservices
date: 2019-08-17T10:02:01+02:00
tags: microservices
---

## Single deployment

If the system you are developing is intended to be delivered by a single team (or a single backend team), there might be less need for a decomposed solution where parts can be deployed separately. This also applies if you are starting out on something relatively small and don't have the operations setup for doing microservices.

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

### Plugins

How would you wire up such a solution? My instinct would be to use plugin architecture to be able to load the different parts into a main project:

- In for instance [Jenkins](https://jenkins.io/) you have the ability to write [plugins](https://wiki.jenkins.io/display/JENKINS/Plugin+tutorial).
- [MEF](https://docs.microsoft.com/en-us/dotnet/framework/mef/) is used by Lucene.net in order to create docs plugins
- CMS systems usually support plugins in order to extend the functionality. See [Wordpress plugins](https://wordpress.org/plugins/) or [Sharepoint addin](https://docs.microsoft.com/en-us/sharepoint/dev/sp-add-ins/sharepoint-add-ins).

If we contrast microservices to plugins what do we find?

Plugins usually need to follow the package versions and language restrictions of the host runtime.

There isn't always a natural way to test plugins in isolation, while for a http service you can use curl.

There is an operations overhead for using several deployments (though that can be negligible depending on your solution).

### Modularized monolith

Another approach is to avoid the plugin style and create a repository with subfolders for separate modules, then a single delivery project that aggregates all of the modules. You still have questions also seen for plugins. One benefit is that you avoid needing to define extensibility points in order to allow plugin development.

One example of this approach can be found in [SimplCommerce](https://github.com/simplcommerce/SimplCommerce). Note the use of both frontend and backend parts per module.

## Serverless

As we see on [martinfowler](https://martinfowler.com/articles/serverless.html) this type of solution can be thought of as a style of microservices solution.

We see that there is vendor specific solutions and open source versions in this space. The most interesting things I've seen here are open source implementations of serverless on top of Kubernetes.

By going serverless you can avoid some of the operations aspects of microservices (especially if you go with a cloud provider solution).

## Conclusion

There are some pros and cons to going with one architecture over another. Depending on what you build, it doesn't always make sense to go with a microservices approach why the other styles might be applicable.
