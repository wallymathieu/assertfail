---
layout: post
title: Kibana vs Elmah like gui
date: 2015-03-13T23:05:13+01:00
---

The nice thing about using [Kibana](https://www.elastic.co/products/kibana) for your logs is that you get nice custom filtering. Thus it's very easy for  others to only view errors they feel that are relevant to them.

If you have a many systems (gui's, services, etc) where you pipe a lot of log data into the same log database, then it can be beneficial to to filter out systems that you're not coding anything in.

The downside of having easy filters is that it's really easy to ignore errors. A screen with the graph of all errors could perhaps mitigate that.

It would be nice to have [Elmah](https://code.google.com/p/elmah/) like formatting of stacktraces. Perhaps a chrome plugin could fix that. Perhaps port the stacktrace parsing from [ElasticElmah](https://github.com/wallymathieu/ElasticElmah) to js.

The nice thing about having your logs in elastic is that you don't need to just use kibana to query your logs. It's really easy to use [Nest](http://nest.azurewebsites.net/) to do queries. Unless you have huge amount of logs you can do groupings in memory.
