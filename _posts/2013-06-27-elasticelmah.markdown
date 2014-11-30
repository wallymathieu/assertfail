---
layout: post
title:  "ElasticElmah"
date: 2013-06-27T11:38:00+02:00
tags: elasticsearch log
---

I've written a small appender for log4net. This appender saves the data to elasticsearch. Why is this sweet? Because elasticsearch has <a href="http://www.elasticsearch.org/guide/reference/mapping/ttl-field/">expiration date</a> field. Since the format is log4net there are very few code changes in application. Why the name <a href="https://code.google.com/p/elmah/">elmah</a>? I've used elmah as a starting point for simple logging before. Since there is a properties dictionary on the log4net objects I can add all the data that elmah usually provides for a web developer. Give it a try or <a href="https://github.com/wallymathieu/ElasticElmah">fork it</a>.
<div style="clear: both;"></div>