---
layout: post
title:  "Whats wrong with Commerce Server 2009"
date: 2011-01-26T19:00:00+01:00
categories: commerce_server sharepoint unit-test whats_wrong
---

<div dir="ltr" style="text-align: left;" trbidi="on">
<span class="Apple-style-span" style="font-size: x-large;">Whats wrong with Commerce Server 2009 </span><br><span class="Apple-style-span" style="font-size: large;">from a developer perspective?</span><br><ol style="text-align: left;">
<li>Configuration: There is no single source of object mapping configuration. 
Multiple places to insert properties.</li>
<li>FaultException does not include the original exception.</li>
<li>The CS2009 api's look very dynamic... It promises a lot more than it can deliver since it is based upon CS2007 API and thus quite limited.</li>
<li>No transactions for some of the entities. For instance profiles and catalog. </li>
<li>Integration with SharePoint by putting the configuration in SharePoint web.config. That's not the way to go.</li>
<li>Granular permissions for all the web services, for all the databases. There is a lot of work just setting up CS. </li>
<li>Pipelines.... </li>
</ol>
<ul style="text-align: left;"></ul>
<div>
<br>
</div>
<div>
<span class="Apple-style-span" style="font-size: x-large;">How do you improve the experience?</span><br><ol style="text-align: left;">
<li>Configuration: Just try to write integration tests to catch any errors due to configuration.</li>
<li>Problem with FaultException is fixed in <a href="http://social.msdn.microsoft.com/Forums/en/commserver2009/thread/e33de899-3768-4fea-a914-641485291ef7">CS2009 r2 CTP</a> ... Until an actual release, you might need to write your own logging for operation sequences (theres an extension point for this, just look at <a href="http://msdn.microsoft.com/en-us/library/dd451660(v=cs.90).aspx">Microsoft.Commerce.Common.TextLoggingExceptionHandler</a> and the configuration). I've not tried this, so I have had to look in the console output or Event log. </li>
<li>You could, if you had the time, write a different implementation of the operation sequence that does the queries for the basket or any other CS entity. I don't know what level of the API the pipelines depend on. Probably easier to just ignore this issue and write some code that searches the CS database.</li>
<li>This is a serious issue. This means that you will need to clean up manually after any integration test. Just keep your integration tests small and write fake implementations of the CS entities repositories so that you can write unit tests.</li>
<li>If you're not using default configuration and don't need any serious modification of the web parts distributed with CS2009 then try to as early as possible,  put CS within it's own web site and implement your web service wrapper around the methods using CS. Could be a bit tricky, but might save you a lot of work. It's simple math, one big product configuration inside another big product with a lot of configuration equals a lot of work if you're unlucky. I've heard rumors that Microsoft is implementing a service oriented version of CS (but until then, you'll have to implement it yourself).</li>
<li>Permissions: <a href="http://www.microsoft.com/downloads/en/details.aspx?FamilyID=8344d2bc-142a-4609-abab-db7f9a1e0f65&amp;displaylang=en">RTFM</a>! To install CS you need to make sure that everything is setup correct.</li>
<li>Pipelines: If possible try to avoid using them.</li>
</ol>
</div>
</div>
<div style="clear: both;"></div>