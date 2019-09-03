---
layout: post
title: Masstransit
date: 2019-09-02T12:09:59+03:00
tags: microservices
---

[Masstransit](https://github.com/MassTransit/) is a wrapper around message queues, such as [RabbitMQ](https://www.rabbitmq.com/),in order to simplify work on distributed applications using .NET.

## What is it good for

One common task is to make sure that services react to relevant events. Instead of polling you can tie your system together using async events.

- Put entity/article/object in a search engine once it's published
- Update information in data warehouse
- Trigger information requests from external partners

Another usage is to handle long running tasks without the user waiting on them. Say for instance that you fire off an event or a command once an offer is requested. There might be potentially many integrations involved in a business flow, why it then makes sense to return early with a first message to the potential client "We are processing your request", then you could send email and server side sent event to the user once you have finished processing.

Having message queue allows you decouple services. If you publish an event, there isn't a strict need for a specific receiver. This allows you to start work on "basket" service before a "catalog" service is fully finished (then wire up logic to deal with inconsistencies later on).

## What is it not good for

RabbitMQ et.c. throws away the messages after they have been successfully processed. If you want to be able replay old events, then this is not for you.

Masstransit (and similar wrappers) makes assumptions about how you want to deal with failures, what kind of format and how send vs publish works. This can mean that there are some discrepancies when implementing publishers and receivers in other languages than c#. Going towards a more heterogenous environment you will probably need to invest more into getting to know your message queue. In a previous project there was a need to invest in [adjusting an AMQP wrapper](https://github.com/carable/MassTransit.js/pulls?q=is%3Apr+is%3Aclosed) for nodejs since the existing wrapper was out of date and did not implement the correct error handling. There is a [Java port](https://github.com/amhest/MassTransit-CrossTown) where the author mentions that he only needed a subset of features available from Masstransit in Java.

If you want to send out events on a very granular high volume, say each time someone views a page on a very popular site, then this is probably not for you. You should look at alternatives like Kafka.

## Problems with distributed transactions

Transaction lock on multiple databases is a known costly affair. There are a couple of options of dealing with this. One way is to have a really large database so that the transaction is over a single database. Another way is to use the [saga pattern](https://microservices.io/patterns/data/saga.html) to avoid those issues. Note for instance [The Coffee Shop OrderStateMachine](https://github.com/MassTransit/TheCoffeeShop/blob/049e022e49da6060dd1d132bf97b1e86171c21c8/src/TheCoffeeShop.Components/StateMachines/OrderStateMachine.cs).

Another way is to think about data in a slightly different way: For instance by storing events and later on generate the resulting relational view of data at one point in time.

## Setup

If you are on Azure then Azure Service bus is simple to setup. There are also NuGet packages to use Masstransit with [AmazonSQS](https://www.nuget.org/packages/MassTransit.AmazonSQS) and [ActiveMQ](https://www.nuget.org/packages/MassTransit.ActiveMQ) but these are more recent than the [RabbitMQ](https://www.nuget.org/packages/MassTransit.RabbitMQ) and [Azure Service bus](https://www.nuget.org/packages?q=masstransit+azure) packages. Easiest way to start locally is to use RabbitMQ by writing a docker-compose file:

```yml
version: '3.4'

services:
  rabbitmq:
    image: rabbitmq:3-management-alpine
    ports:
      - "15672:15672"
      - "5672:5672"
```

## Cost

Masstransit is open source and free. RabbitMQ requires hosting. See AWS and Azure for pricing of their offerings.

## Conclusion

Masstransit (and similar) allows you to wire up loosely coupled distributed [mediator](https://en.wikipedia.org/wiki/Mediator_pattern). Since Masstransit allows you to use either RabbitMQ, AWS or Azure native message queues it is fairly easy to have it up and running. It is a leaky abstraction when you are going towards a heterogenous environment (but reimplementing subsets of Masstransit can be good enough).
