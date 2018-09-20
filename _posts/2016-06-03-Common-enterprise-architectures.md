---
layout: post
title: Common enterprise architectures
date: 2016-06-03T20:24:52+02:00
tags: meta
---

Some patterns I've usually encountered while working code bases written by .net developers. You can also read more on [msdn](https://msdn.microsoft.com/en-us/library/ee658117.aspx).

## [Domain driven design](https://en.wikipedia.org/wiki/Domain-driven_design) inspired

Usually you find classes with postfix name like:

- Repository : List like interface for working with persisted data. Usually state of fetched objects is tracked, so you can do ```customerContext.Save()``` to persist changes to objects.
- [Service](https://en.wikipedia.org/wiki/Service_(systems_architecture))  

### Related concepts

People are often confused by "Unit of work" also mentioned in connection to these patterns. Many OR-mappers implement the repository pattern. Popular libraries include [Entity Framework](http://www.asp.net/entity-framework), [NHibernate](http://nhibernate.info/) and [RavenDB](https://ravendb.net/) (library and database).

### Key concept

The key point of DDD is ubiquitous Language. Being able to have roughly the same type of concepts as the users can be very helpful.

## [DAL](https://msdn.microsoft.com/en-us/library/ee658127.aspx)

This type of architecture is quite simple. The main benefit of it is that it's easy for people to grok. This type of architecture is not as popular anymore because it increases the amount of code you have to write.

- Manager : An object that does things by using other managers and accesses the data using DAL
- DAL : Data access layer. State for fetched objects is not tracked. You have to make the DAL aware of changes ```customerDAL.Update(customer);```  
- DTO : Data transfer object.

In this type of architecture it's not uncommon to have an additional layer in the database implemented by stored procedures.

## Message queue & Service Bus

Popular choices I've encountered are [RabbitMQ](https://en.wikipedia.org/wiki/RabbitMQ) and [MSMQ](https://en.wikipedia.org/wiki/Microsoft_Message_Queuing). A popular library is [MassTransit](https://github.com/MassTransit/MassTransit). 

Provides a way to lower cohesion between components. Can also be helpful if you want to [distribute work](http://www.rabbitmq.com/tutorials/tutorial-two-python.html).
