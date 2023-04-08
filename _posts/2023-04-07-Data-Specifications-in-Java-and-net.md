---
layout: post
title: Data Specifications in Java and .net
date: 2023-04-07T16:17:13+02:00
tags: C# Java
---

## Background

In [dotnet-architecture/eShopOnWeb](https://github.com/dotnet-architecture/eShopOnWeb) I noticed the interesting usage of Specification classes. When I did some digging, I found that these are implemented through [ardalis/Specification](https://github.com/ardalis/Specification) For those who are more familiar with the Java world we have [Data Specifications](https://spring.io/blog/2011/04/26/advanced-spring-data-jpa-specifications-and-querydsl). If you read Implementing Domain Driven design in the bibliography you find a reference to [Martin Fowlers paper](https://martinfowler.com/apsupp/spec.pdf).

## Sample based on Wikipedia

So if we look at [Wikipedia](https://en.wikipedia.org/wiki/Specification_pattern) we can infer the following code:

```c#
public class OverDueSpecification : ISpecification<Invoice>
{
    public bool IsSatisfiedBy(Invoice entity)
    {
        return entity.PayDeadline < DateTime.Now;
    }
}
// ...
var overDue = new OverDueSpecification();
var noticeSent = new NoticeSentSpecification();
var inCollection = new InCollectionSpecification();

var sendToCollection = overDue.And(noticeSent).And(inCollection.Not());
```

## Higher level abstractions

We see that Ardalis Specifications collects `System.Linq.Expression` (note the lambda):

```c#
public class OverDueSpecification : Specification<Invoice>
{
  public OverDueSpecification()
  {
    Query.Where(entity => entity.PayDeadline < DateTime.Now);
  }
}
```

This can be seen as an alternative API to the interfaces used by EF like [IDbSet<>](https://learn.microsoft.com/en-us/dotnet/api/system.data.entity.idbset-1?view=entity-framework-6.2.0) and [IQueryable<>](https://learn.microsoft.com/en-us/dotnet/api/system.linq.iqueryable-1?view=net-7.0).

## Modules

Since the point of the pattern is that you should be able to separate the query specification from the data you could argue that the pattern is satisfied by having a module of specifications where you create the specification instances through method calls:

```c#
public static class InvoiceSpecifications
{
  public static IQueryable<Invoice> OverDue(this IQueryable<Invoice> query)
  {
    return query.Where(entity => entity.PayDeadline < DateTime.Now);
  }
}
```

```c#
public class InvoiceSpecifications
{
  public static JPAQuery<Invoice> overDue(JPAQuery<Invoice> query)
  {
    QInvoice invoice= QInvoice.invoice;
    return query.from(invoice).where(invoice.payDeadline.lastname.lt(LocalDateTime.now());
  }
}
```

## Conclusion

The choice of using a class for a single specification or a method depends on how visible you want these specifications to be. By having a class in a separate file with a single specification, it becomes browsable. Some might argue that this introduces ceremony, but that depends on the preferences of the team (as can be seen in the eShopOnWeb example).
