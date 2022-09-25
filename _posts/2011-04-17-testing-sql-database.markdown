---
layout: post
title:  "Testing SQL database"
date: 2011-04-17T15:40:00+02:00
tags: db integration_test migrations
---

What strategies do I know of on how to test your code depending on a database?

1. Using [TransactionScope](http://msdn.microsoft.com/en-us/library/system.transactions.transactionscope.aspx) so that you can roll back any changes done by tests.
2. Setting up a fresh database with the same schema.
    - Using NHibernate SchemaExport(cfg).Execute to export an existing schema onto the new database.
    - Run your migrations to set the database in the correct state.
    - Use Code First, auto migrations or whatchamacallit call it. That is, let the ORM generate the tables and columns based upon your data objects. For instance Entity Framework Code First or Subsonic Auto Migrations. 

What are the pros and cons of these approaches?

1. TransactionScope:
    - **Pros**: Very easy to setup. If you have a local version of the database, it's very easy to get started.
    - **Cons**: Running everything under a transaction can be very costly. You need to tweak the configuration of the transaction coordinator. If you forget to use TransactionScope, there is a danger that you get rubbish data in your test database making your tests brittle.

2. Fresh database with the same schema:
    - **Pros**: By having migrations that are well tested, it can be considerably easier to create new installations. 
    - **Cons**: Using a slightly different schema for your tests (for instance if you have sql scripts to do changes to the database and turn on Code First in your tests) can lead to unexpected behavior. If your logic depends on database specific functionality you might want to use migrations in order to have a fully working schema. It can also be a bit harder to setup. If you use a different database (for instance SQLite), database specific behavior may be an issue. Same vendor but different collation might also give you a headache.