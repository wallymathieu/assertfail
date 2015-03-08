---
layout: post
title: Event sourcing and in memory database
date: 2015-03-03T21:38:37+01:00
tags: db
---

Trying out [OrigoDb](https://github.com/wallymathieu/origodb-studies), I found it interresting to try out a more raw [file store approach](https://github.com/wallymathieu/filedb-studies) and [NEvent Store](https://github.com/wallymathieu/nevent-store-studies). Why the connection Event Sourcing and In memory databse? Mostly because I tried out OrigoDb first. In memory database feels like a nice fit for Event Sourcing (since the log that can restore the database can be persisted in an append only manner).

Many of us have heard or read Martin Fowlers [Event Sourcing](http://martinfowler.com/eaaDev/EventSourcing.html). He mentions in memory databases in the article as well.

OrigoDb is a bit easier to setup compared to NEvent store. NEvent store is more mature. I like that you don't need to inherit from a base class in NEvent Store. It does mostly what it says it does: Persists events. This means that it if you want to use it for an in memory situation you probably should make the objects readonly. The OrigoDb approach of using inheritance gives you fewer lines of code (since you don't get command and handler types). NEvent store is more talkative and requires more code to handle events.

Since OrigoDb assumes that you want help with making absolutely sure that your in memory data is not corrupted by a assignment of on an object you need to interact with the it in a slightly different manner (from [OrigoDb CustomerDataTests](https://github.com/wallymathieu/origodb-studies/blob/master/Tests/CustomerDataTests.cs#L28) ):

```
        [Test]
        public void CanGetCustomerByFirstname()
        {
            var customers = _engine.Execute(m=>
                m.QueryOverCustomers()
                .Where(c => c.Firstname == "Steve")
                .ToList());
            Assert.AreEqual(3, customers.Count);
        }
```

Storing your events in an append manner on the filesystem is the easiest approach. Use of readonly objects simplifies things (easier to make sure that the data does not diverge). Perhaps a usecase for [With](https://github.com/wallymathieu/with/blob/master/src/Tests/With/Clone_an_instance_into_the_same_type.cs)?

The problem with using the filesystem directly is that it's not ACID. However, you get ACID [using OrigoDb](http://dev.origodb.com/docs/transactions/).

 