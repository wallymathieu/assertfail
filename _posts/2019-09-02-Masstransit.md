---
layout: post
title: Masstransit
date: 2019-09-02T12:09:59+03:00
tags: microservices
---

## What is it good for

One common task is to make sure that services react to relevant events. Instead of polling you can tie your system together using async events.

- Put entity/article/object in a search engine once it's published
- Update information in data warehouse
- Trigger information requests from external partners

Another usage is to handle long running tasks without the user waiting on them. Say for instance that you fire off an event or a command once an offer is requested. There might be potentially many integrations involved in a business flow, why it then makes sense to return early with a first message to the potential client "We are processing your request", then you could send email and server side sent event to the user once you have finished processing.

Having message queue allows you decouple services. If you publish an event, there isn't a strict need for a specific receiver. This allows you to start work on "basket" service before a "catalog" service is fully finished (then wire up logic to deal with inconsistencies later on).

## What is it not good for

RabbitMQ et.c. throws away the messages after they have been successfully processed. If you want to be able replay old events, then this is not for you.

If you want to send out events on a very granular high volume, say each time someone views a page on a very popular site, then this is probably not for you. You should look at alternatives like Kafka.

## Problems with distributed transactions

Transaction lock on multiple databases is a known costly affair. There are a couple of options of dealing with this. One way is to have a really large database so that the transaction is over a single database. Another way is to use the [saga pattern](https://microservices.io/patterns/data/saga.html) to avoid those issues. Note for instance [The Coffee Shop OrderStateMachine](https://github.com/MassTransit/TheCoffeeShop/blob/049e022e49da6060dd1d132bf97b1e86171c21c8/src/TheCoffeeShop.Components/StateMachines/OrderStateMachine.cs).

Another way is to think about data in a slightly different way: For instance by storing events and later on generate the resulting relational view of data at one point in time.

## Cost

Masstransit is open source and free. RabbitMQ requires hosting. See Azure pricing for the cost of Azure Service bus.

## Setup

If you are on Azure then Azure Service bus is simple to setup. Otherwise you have hosted RabbitMQ that you can use. Easiest way to start using RabbitMQ is to write a docker-compose file such as:

```yml
version: '3.4'

services:
  rabbitmq:
    image: rabbitmq:3-management-alpine
    ports:
      - "15672:15672"
      - "5672:5672"
```

## Conclusion

Masstransit (and similar) allows you to wire up loosely coupled distributed [mediator](https://en.wikipedia.org/wiki/Mediator_pattern). Since Masstransit allows you to use either RabbitMQ, Azure Service Bus it is fairly easy to have it up and running.
