---
layout: post
title:  "Whats wrong with Commerce Server 2009"
date: 2011-01-26T19:00:00+01:00
tags: whats_wrong commerce_server
---

Whats wrong with Commerce Server 2009 from a developer perspective?

1. Configuration: There is no single source of object mapping configuration. Multiple places to insert properties.
2. FaultException does not include the original exception.
3. The CS2009 api's look very dynamic... It promises a lot more than it can deliver since it is based upon CS2007 API and thus quite limited.
4. No transactions for some of the entities. For instance profiles and catalog. 
5. Integration with SharePoint by putting the configuration in SharePoint web.config. That's not the way to go.
6. Granular permissions for all the web services, for all the databases. There is a lot of work just setting up CS.
7. Pipelines....

How do you improve the experience?

1. Configuration: Just try to write integration tests to catch any errors due to configuration.
2. Problem with FaultException is fixed in [CS2009 r2 CTP](http://social.msdn.microsoft.com/Forums/en/commserver2009/thread/e33de899-3768-4fea-a914-641485291ef7) ... Until an actual release, you might need to write your own logging for operation sequences (theres an extension point for this, just look at [Microsoft.Commerce.Common.TextLoggingExceptionHandler](http://msdn.microsoft.com/en-us/library/dd451660(v=cs.90).aspx) and the configuration). I've not tried this, so I have had to look in the console output or Event log.
3. You could, if you had the time, write a different implementation of the operation sequence that does the queries for the basket or any other CS entity. I don't know what level of the API the pipelines depend on. Probably easier to just ignore this issue and write some code that searches the CS database.
4. This is a serious issue. This means that you will need to clean up manually after any integration test. Just keep your integration tests small and write fake implementations of the CS entities repositories so that you can write unit tests.
5. If you're not using default configuration and don't need any serious modification of the web parts distributed with CS2009 then try to as early as possible,  put CS within it's own web site and implement your web service wrapper around the methods using CS. Could be a bit tricky, but might save you a lot of work. It's simple math, one big product configuration inside another big product with a lot of configuration equals a lot of work if you're unlucky. I've heard rumors that Microsoft is implementing a service oriented version of CS (but until then, you'll have to implement it yourself).
6. Permissions: [RTFM](http://www.microsoft.com/downloads/en/details.aspx?FamilyID=8344d2bc-142a-4609-abab-db7f9a1e0f65&displaylang=en)! To install CS you need to make sure that everything is setup correct.
7. Pipelines: If possible try to avoid using them.
