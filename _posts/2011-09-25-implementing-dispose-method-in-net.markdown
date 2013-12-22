---
layout: post
title:  "Implementing Dispose method in .net"
date: 2011-09-25T21:30:00+02:00
categories: c# memory management
---

<span class="Apple-style-span" style="font-size: large;">Dispose</span><br>
In order to release unmanaged resources you need to use or implement the dispose method.<br><br><span class="Apple-style-span" style="font-size: large;">Unmanaged resource</span><br>
So what is an unmanaged resource? It is simply resources that the CLR does not manage for you. For example: File streams, database connections, P/Invoked api:s.<br><br><span class="Apple-style-span" style="font-size: large;">How to implement Dispose?</span><br>
Msdn gives a rather clear <a href="http://msdn.microsoft.com/en-us/library/fs2xkftw.aspx">answer</a>.<br><br><ol>
<li>You need to implement the IDisposable interface. </li>
<li>If you have implemented a finalizer as well then you need to add a call to <span class="Apple-style-span" style="font-family: Consolas, Courier, monospace; font-size: 13px; white-space: pre;">GC.SuppressFinalize </span>inside the dispose method. This is to avoid that the finalize method is called for the object.</li>
</ol>
<br><span class="Apple-style-span" style="font-size: large;">When is it unsafe to call both dispose and finalize?</span><br>
One reason could be that you're dealing with a P/Invoked api. Telling the unmanaged code to clean up the resources associated with a particular pointer twice can cause unintended consequences. Using closed handles is a security risks since windows recycles handles. Another reason is performance: A finalize is costly to perform.<br><br><span class="Apple-style-span" style="font-size: large;">Alternative to using IntPtr</span><br>
In order to simplify the use of operating system handles you can use "Safe Handle".
<div style="clear: both;"></div>