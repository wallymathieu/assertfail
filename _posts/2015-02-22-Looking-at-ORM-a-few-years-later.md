---
layout: post
title: Looking at ORM a few years later
date: 2015-02-22T12:20:38+01:00
tags: db
---

When I first started using entity framework (one of the earlier versions) it was not ready yet (some serious performance issues). A few years later I hear good things about it from other developers.

In order to try to get a feel for how the state of entity persistance is today I've ported an old [nhibernate](http://nhibernate.info/) test [project](https://github.com/wallymathieu/nhibernate-studies) to a test [project](https://github.com/wallymathieu/entity-framework-studies)
 for [entity framework](https://msdn.microsoft.com/en-us/data/ef.aspx).

I initially had some trouble due to my choice of sql express to test the mappings. Once I managed to get EF to use sqlite the testing got much easier.

Both ORM's support auto-mapping of POCO objects to the database entities. The fluent auto-mapping for NHibernate looks like it can figure out many to many relations.

The setup of NHibernate is a bit easier since you are not dependant on that web or app config factory settings. You get less confusion in the documentation for the NHibernate xml configuration. It looks like the people behind EF is aware of the problem and [working on it](https://msdn.microsoft.com/en-us/data/jj680699.aspx).

Both frameworks can require some getting used to.

Note that both frameworks works well with [fluent migrator](https://github.com/schambers/fluentmigrator) to test against a sql-ish database. One way of getting a nice development flow could perhaps be to use sqlite on dev machines for integration testing and letting the CI machine run the tests against what you're using on production.
