---
layout: post
title:  "Testing SQL database"
date: 2011-04-17T15:40:00+02:00
tags: db integration_test migrations
---

<div dir="ltr" style="text-align: left;" trbidi="on">
What strategies do I know of on how to test your code depending on a database?<br><br><ol style="text-align: left;">
<li>Using <a href="http://msdn.microsoft.com/en-us/library/system.transactions.transactionscope.aspx">TransactionScope</a> so that you can roll back any changes done by tests.</li>
<li>Setting up a fresh database with the same schema.</li>
<ol>
<li>Using NHibernate SchemaExport(cfg).Execute to export an existing schema onto the new database.</li>
<li>Run your migrations to set the database in the correct state.</li>
<li>Use Code First, auto migrations or whatchamacallit call it. That is, let the ORM generate the tables and columns based upon your data objects. For instance Entity Framework Code First or Subsonic Auto Migrations. </li>
</ol>
</ol>
<div>
What are the pros and cons of these approaches? </div>
<div>
<ol style="text-align: left;">
<li>TransactionScope:</li>
<ol>
<li>
<b>Pros</b>: Very easy to setup. If you have a local version of the database, it's very easy to get started.</li>
<li>
<b>Cons</b>: Running everything under a transaction can be very costly. You need to tweak the configuration of the transaction coordinator. If you forget to use TransactionScope, there is a danger that you get rubbish data in your test database making your tests brittle.</li>
</ol>
<li>Fresh database with the same schema:</li>
<ol>
<li>
<b>Pros</b>: By having migrations that are well tested, it can be considerably easier to create new installations. </li>
<li>
<b>Cons</b>: Using a slightly different schema for your tests (for instance if you have sql scripts to do changes to the database and turn on Code First in your tests) can lead to unexpected behavior. If your logic depends on database specific functionality you might want to use migrations in order to have a fully working schema. It can also be a bit harder to setup. If you use a different database (for instance SQLite), database specific behavior may be an issue. Same vendor but different collation might also give you a headache.</li>
</ol>
</ol>
</div>
</div>
<div style="clear: both;"></div>