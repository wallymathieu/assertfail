---
layout: post
title: Data Specifications in Java and .net
date: 2023-04-07T16:17:13+02:00
tags: C# Java
---

In [dotnet-architecture/eShopOnWeb](https://github.com/dotnet-architecture/eShopOnWeb) I noticed the interesting usage of Specification classes. When I did some digging, I found that these are implemented through [ardalis/Specification](https://github.com/ardalis/Specification) For those who are more familiar with the Java world we have [Data Specifications](https://spring.io/blog/2011/04/26/advanced-spring-data-jpa-specifications-and-querydsl).

How do these solutions compare to each other? It seems that the specification pattern can imply a builder style query without the using lambdas/delegates.

```c#
var overDue = new OverDueSpecification();
var noticeSent = new NoticeSentSpecification();
var inCollection = new InCollectionSpecification();

var sendToCollection = overDue.And(noticeSent).And(inCollection.Not());
```

From [wikipedia](https://en.wikipedia.org/wiki/Specification_pattern).

We see that Ardalis Specifications collects `System.Linq.Expression` (note the lambdas):

```c#
public class CustomerSpec : Specification<Customer>
{
  public CustomerSpec(CustomerFilter filter)
  {
    if (!string.IsNullOrEmpty(filter.Name))
      Query.Where(x => x.Name == filter.Name);

    if (!string.IsNullOrEmpty(filter.Email))
      Query.Where(x => x.Email == filter.Email);

    if (!string.IsNullOrEmpty(filter.Address))
      Query.Search(x => x.Address, "%" + filter.Address + "%");
  }
}
```

We can perhaps see `ISpecification<>` and `ISpecificationBuilder<>`  is an alternative API when compared with `IQueryable<>`.
