---
layout: post
title:  "Domain analysis of an application database"
date: 2012-03-18T13:32:00+01:00
tags: db ddd
---

A relational database is not only a source of content. It can also be used as a mine for domain information related to domain of an application that uses that database. The schema, if it is well maintained, will give you an overview of the problem domain. If the schema is not well maintained, you can factor out the conventions used in that particular database for relations and create a patched schema with the real relations. As you generate a graph of the database you can start filtering out some of the details (important for business logic) but not for the big picture. Some of the things you can get from the graph will be trivial. It might also give you a better understanding of the big picture. By plotting this graph, you can get a overview helpful for identifying subdomains.<br><br>
Maybe if we have a sufficiently large body of text describing the domain we can use a statistical approach to identify words relevant to the domain. The identification of these words will probably be easier if we have some larger body of text to use as for comparison of the frequencies of sentence construction words in that language (that is to filter out words like: 'the', 'for', 'he', 'she' et.c. in english).<br><br>
By combining the above simple domain mining techniques and talking to people fluent in the domain you can get a shallow technical understanding of the domain. This can be helpful for understanding the details of the domain.
<div style="clear: both;"></div>