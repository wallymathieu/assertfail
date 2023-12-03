---
layout: post
title: Small and simple business applications using SQL
date: 2022-04-03T09:42:31+01:00
tags: SQL C# nodejs architecture
---

Say that you want to write a minimal API as seen in [Can .net compete with NodeJS](/2021/11/10/Can-net-compete-with-nodejs.html). How would you structure such an application? You would end up with something like 0-1 layers in your application.

Some of my previous coworkers embrace these patterns in order to focus on business value. In this post I'll try to get into how you could make such a system without going into detail (pointing instead to examples).

## Embrace SQL

One way to write simple API's is to embrace SQL when you feel that it's appropriate. See for instance [It's Time To Get Over That Stored Procedure Aversion You Have](https://rob.conery.io/2015/02/21/its-time-to-get-over-that-stored-procedure-aversion-you-have/).

If you have need a low ceremony application that does not need much in the way of server side logic, there is no need to over-engineer the application.

There is a sample in [NodeJs](https://github.com/dtao/todo-backend-express) that is also ported to [TypeScript](https://github.com/wallymathieu/todo-backend-express). Just make sure to [keep things parameterized](https://owasp.org/www-community/attacks/SQL_Injection).

## SQL and Document databases

When you read a big object graph and store the same structure in one go, your application logic can be significantly simplified if you store that structure in one go without having to normalize the structure into a SQL view of the world. You could also view [PostgreSQL as a DocumentDB](https://martendb.io), so there might not need to be a hard divide between the SQL and the DocumentDB view of the world.

Note for instance the [tutorial from MongoDB](https://www.mongodb.com/blog/post/getting-started-with-python-and-mongodb) where the JSON is as follows:

```JSON
{
  "first_name": "Paul",
  "surname":"Miller",
  "cell": "447557505611",
  "city":"Lenden",
  "location": [45.123,47.2321],
  "profession": ["banking","finance","trader"],
  "cars":[
    {
      "model":"Bentley",
      "year": 1973,
      "value": 100000
    },
    {
      "model":"Rolls Royce",
      "year": 1965,
      "value": 338080
    }]
}
```

A decomposition into SQL could be:

```SQL
create table customers(
  customer_id int identity(1,1),
  first_name nvarchar(255),
  surname nvarchar(255),
  cell nvarchar(100),
  city nvarchar(50),
  location POINT,
  primary key (customer_id));

create table professions(
  profession_id int identity(1,1),
  description nvarchar(255),
  primary key (profession_id)
);
create table customer_professions(
  profession_id int not null foreign key references professions (profession_id),
  customer_id int not null foreign key references customers(customer_id),
  primary key (customer_id,profession_id),
);

insert into customers (first_name,surname,cell,city,
                       location)
               values ('Paul','Miller','447557505611','Lenden',
                       POINT(45.123,47.2321));
insert into professions (description) values ('banking'),('finance'),('trader')
insert into customer_professions (profession_id, customer_id)
select p.profession_id, c.customer_id
from professions p where p.description in ('banking','finance','trader')
from customer c where c.first_name = 'Paul' and surname = 'Miller' ... -- assuming only one such customer ...
```

The structured nature of SQL also implies that you would need a bit more code in order to deal with the data.

Both [Postgresql](https://rob.conery.io/2020/02/05/postgres-for-those-who-cant-even-part-2-working-with-node-and-json/) and [Microsoft SQL Server](https://docs.microsoft.com/en-us/sql/relational-databases/json/json-data-sql-server?view=sql-server-ver15) support the use JSON. You can write views on top of JSON information in order to select the information. For migrating the schema you could take [a note from RavenDB](https://ayende.com/blog/66563/ravendb-migrations-rolling-updates).

## Testing it

When you write tests for a system that does not shy away from using the database as its core:

- Setting up a development DB in a docker container can reduce complexity when setting up a development environment.
- SQL Migrations makes it easier to keep databases in sync (and will incidentally make it easier to deploy your code).
- There is an overhead when using a real database for tests. Though that [overhead can be small](https://dhh.dk/2014/slow-database-test-fallacy.html). For systems that span over 200+ tables that overhead should not be underestimated (though such a system should probably be decomposed for [many reasons](https://microservices.io/patterns/monolithic.html)).

## Schema migrations

Being more structured when it comes to migrations will (from what I've seen) pay off, since it means that you can offload work to computers such as automated deployment, testing and the act of keeping databases in sync.

Some of the migration frameworks I've used (note that all of them allow for raw SQL migrations in some way or another):

In the .net world:

- [EF migrations](https://docs.microsoft.com/en-us/ef/core/managing-schemas/migrations/?tabs=dotnet-core-cli) : These migrations are nice enough if you let the object-model drive your database model.
- [Fluent migrations](https://fluentmigrator.github.io) : Nice tool that makes it easy to write up and down migrations when you use their API to write simple enough migrations.
- [DbUp](https://dbup.readthedocs.io/en/latest/) : Nice tool when you want to focus on SQL (you write sql-files).

In the Ruby world:

- [Rails migrations](https://guides.rubyonrails.org/v3.2/migrations.html) : Nice migration framework that make it easy write simple reversible migrations when you use their API for simple enough migrations.

## Abstractions and schema

Keeping fewer layers means that there are fewer abstractions that people need to learn. This can help make the development more accessible to newbies. Having 200+ tables does not make for a pleasant experience going into a system. I've spent a lot of time at work [to make sense out of such schemas](https://github.com/wallymathieu/mejram). In many SQL implementations you can have multiple schemas in the same database in order to make things easier to understand.

## The dreaded Monolith

In a sense many of the systems that you start to dread start out as small systems. Adding small parts to a system without looking for ways to decompose the system into smaller systems is how you end up with such a mess. There is no need to over-engineer your system until the pain of maintaining the system gets impacted (though note [the boiling frog metaphor](https://en.wikipedia.org/wiki/Boiling_frog) when it comes to the gradual increase in technical debt).

## Conclusion

There are some security implications of embracing SQL, but those can be managed. As long as you keep the system smallish you can have nice enough time for developer written tests. There are as always a challenge around knowing when something has grown too big.
