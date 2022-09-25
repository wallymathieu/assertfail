---
layout: post
title:  "Implementing Dispose method in .net"
date: 2011-09-25T21:30:00+02:00
tags:  C# memory_management
---

### Dispose

In order to release unmanaged resources you need to use or implement the dispose method.

### Unmanaged resource

So what is an unmanaged resource? It is simply resources that the CLR does not manage for you. For example: File streams, database connections, P/Invoked api:s.

### How to implement Dispose?

Msdn gives a rather clear [answer](http://msdn.microsoft.com/en-us/library/fs2xkftw.aspx).

- You need to implement the IDisposable interface.
- If you have implemented a finalizer as well then you need to add a call to ```GC.SuppressFinalize``` inside the dispose method. This is to avoid that the finalize method is called for the object.

### When is it unsafe to call both dispose and finalize?

One reason could be that you're dealing with a P/Invoked api. Telling the unmanaged code to clean up the resources associated with a particular pointer twice can cause unintended consequences. Using closed handles is a security risks since windows recycles handles. Another reason is performance: A finalize is costly to perform.

### Alternative to using IntPtr

In order to simplify the use of operating system handles you can use "Safe Handle".
