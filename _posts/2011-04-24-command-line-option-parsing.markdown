---
layout: post
title:  "Command line option parsing"
date: 2011-04-24T20:10:00+02:00
tags: C# cli
---

<div dir="ltr" style="text-align: left;" trbidi="on">
<span class="Apple-style-span" style="font-size: large;">NDesk Options</span><br>
I started writing an argument parser without knowing about:<br><a href="http://www.ndesk.org/Options">NDesk.Options</a><br>
Where you have the following kind of syntax:<br><span class="Apple-style-span" style="font-family: Verdana, sans-serif; font-size: 13px;"></span><br><pre style="margin-bottom: 1em; margin-left: 1em; margin-right: 1em; margin-top: 1em;">string data = null;
   bool help   = false;
   int verbose = 0;
</pre>
<pre style="margin-bottom: 1em; margin-left: 1em; margin-right: 1em; margin-top: 1em;">var p = new OptionSet () {
    { "file=",      v =&gt; data = v },
    { "v|verbose",  v =&gt; { ++verbose } },
    { "h|?|help",   v =&gt; help = v != null },
   };
   List<string> extra = p.Parse (args);</string></pre>
<span class="Apple-style-span" style="font-size: large;"><span class="Apple-style-span" style="font-size: small;"></span></span><br><div style="margin-bottom: 0px; margin-left: 0px; margin-right: 0px; margin-top: 0px;">
<span class="Apple-style-span" style="font-size: large;"><span class="Apple-style-span" style="font-size: large;">FubuCore</span></span>
</div>
<div style="margin-bottom: 0px; margin-left: 0px; margin-right: 0px; margin-top: 0px;">
<span class="Apple-style-span" style="font-size: large;">Since this post, there is a new option: <a href="http://lostechies.com/chadmyers/2011/06/06/cool-stuff-in-fubucore-no-6-command-line/">Command line in FubuCore</a>.</span><br><span class="Apple-style-span" style="font-size: large;"><span class="Apple-style-span" style="font-size: small;"></span></span><br><span class="Apple-style-span" style="font-size: large;"><span class="Apple-style-span" style="font-size: large;">Powershell</span></span><br><span class="Apple-style-span" style="font-size: large;">If you're using powershell it just might be simpler to load your program as an assembly and invoke the classes directly. Looking at <a href="http://stackoverflow.com/questions/3360867/add-reference-to-dll-in-powershell-2-0">stackoverflow</a> there is a command <a href="http://technet.microsoft.com/en-us/library/dd315241.aspx">Add-Type</a>. Otherwise you could use standard .net assembly load.</span>
</div>
<br><span class="Apple-style-span" style="font-size: large;">Isop</span><br>
All of the solutions above are not really what I'm after. Thus I've written another argument parser loosely based on <a href="http://simpleconsole.rubyforge.org/">SimpleConsole</a> :<br><a href="https://github.com/wallymathieu/isop">Isop</a><br>
I didn't really think views in an console app was that useful. Instead I've tried to do some of the plumbing in order for you to write console applications more like this: <br><pre style="margin-bottom: 1em; margin-left: 1em; margin-right: 1em; margin-top: 1em;">static void Main(string[] args)
{
   new Build()
      .Parameter("server",arg=&gt;server=arg)
      .Recognize(typeof(CustomerController))
      .Parse(args)
      .Invoke(Console.Out);</pre>
<pre style="margin-bottom: 1em; margin-left: 1em; margin-right: 1em; margin-top: 1em;">}</pre>
<br>
There is some simple syntax to extend this. To Set culture, TypeConverter et.c. <br><br>
So you would invoke the method "Add" on the class "CustomerController" with the arguments id and name:<br><br>
CustomerConsoleApp.exe Customer Add --id 1234 --name Arne</div>
<div style="clear: both;"></div>