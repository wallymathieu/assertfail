---
layout: post
title:  "Logging for Commerce Server 2009"
date: 2011-02-08T21:23:00+01:00
tags: commerce_server log
---

You might want to start off by reading the [documentation from Microsoft](http://msdn.microsoft.com/en-us/library/dd451660(v=cs.90).aspx). The short version of this text is that in the new CS2009 there is tracing and it is done through system.diagnostics. I don't know the entire story, but it looks like the exception handling is piped through the trace.

So in order to configure the logging for commerce server you will need to read up on the system.diagnostics tracing.You will need to add a source "Microsoft.Commerce.Exceptions". There you can choose your [TraceListener](http://msdn.microsoft.com/en-us/library/system.diagnostics.tracelistener.aspx) and specify the information you need by reading up on [TraceOptions](http://msdn.microsoft.com/en-us/library/a10k7w6c.aspx).

The default trace configuration can be found in SystemDiagnostics.xml in the Extensibility kit. You should be aware of that the default configuration logs to the Event handler. This is not always appreciated by your customers since they may want to have Medium Trust for the site.

Note that this means that you can also write your own log-handler for these tracing events by inheriting from   [TraceListener](http://msdn.microsoft.com/en-us/library/system.diagnostics.tracelistener.aspx).
