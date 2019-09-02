---
layout: post
title: Masstransit
date: 2019-09-02T12:09:59+03:00
tags: microservices
---

Masstransit (and similar) allows you to wire up loosely coupled distributed [mediator](https://en.wikipedia.org/wiki/Mediator_pattern). Since Masstransit allows you to use either RabbitMQ, Azure Service Bus or in memory it is fairly easy to get up and running and test.

### Events

Note that the contracts are usually harder to change (compared to JSON endpoint), why you'd want to be a bit careful about how you design your messages. Small concrete events are easier to reason about.

```c#
public interface OrderPlaced {
    Guid OrderId { get; }
}
```

Se for instance [Putting your events on a diet](https://particular.net/blog/putting-your-events-on-a-diet)

### What is it good for

One common task is to make sure that services react to relevant events. Instead of polling you can tie your system together using async events.

- Put entity/article/object in a search engine once it's published
- Update information in data warehouse

Another usage is to handle long running tasks without the user waiting on them. Say for instance that you fire off an event once an offer is requested. There might be potentially many integrations involved in a business flow, why it then makes sense to return early with a first message to the potential client "We are processing your request", then you could send email and server side sent event to the user once you have finished processing.

### What is it not good for

RabbitMQ et.c. throws away the messages after they have been successfully processed. If you want to be able replay old events, then this is not for you.

If you want to send out events on a very granular level (say each time someone views a page on a very popular site) then this is not for you.

This brings us to alternatives like Kafka.

### Distributed transactions

Instead of trying to do two-phase commits, you can use the [saga pattern](https://microservices.io/patterns/data/saga.html) to avoid those issues. Note for instance [The Coffee Shop OrderStateMachine](https://github.com/MassTransit/TheCoffeeShop/blob/049e022e49da6060dd1d132bf97b1e86171c21c8/src/TheCoffeeShop.Components/StateMachines/OrderStateMachine.cs).

### Cost

Masstransit is open source and free. RabbitMQ requires hosting. See Azure pricing for the cost of Azure Service bus.

## See also

- [eShop on containers](https://github.com/dotnet-architecture/eShopOnContainers/)
  - [with NServiceBus](https://github.com/Particular/eShopOnContainers)
  - [with CAP](https://github.com/yang-xiaodong/eShopOnContainers)
