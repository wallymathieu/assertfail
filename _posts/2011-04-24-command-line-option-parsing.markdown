---
layout: post
title:  "Command line option parsing"
date: 2011-04-24T20:10:00+02:00
tags: C# cli
---

## NDesk Options

I started writing an argument parser without knowing about:
[NDesk.Options](http://www.ndesk.org/Options)
Where you have the following kind of syntax:

```C#
string data = null;
   bool help   = false;
   int verbose = 0;

var p = new OptionSet () {
    { "file=",      v => data = v },
    { "v|verbose",  v => { ++verbose } },
    { "h|?|help",   v => help = v != null },
   };
   List extra = p.Parse (args);
```

## FubuCore

Since this post, there is a new option: [Command line in FubuCore](http://lostechies.com/chadmyers/2011/06/06/cool-stuff-in-fubucore-no-6-command-line/).

## Powershell

If you're using powershell it just might be simpler to load your program as an assembly and invoke the classes directly. Looking at [stackoverflow](http://stackoverflow.com/questions/3360867/add-reference-to-dll-in-powershell-2-0) there is a command [Add-Type](http://technet.microsoft.com/en-us/library/dd315241.aspx). Otherwise you could use standard .net assembly load.

## Isop

All of the solutions above are not really what I'm after. Thus I've written another argument parser loosely based on [SimpleConsole](http://simpleconsole.rubyforge.org/) :
[Isop](https://github.com/wallymathieu/isop)
I didn't really think views in an console app was that useful. Instead I've tried to do some of the plumbing in order for you to write console applications more like this:

```C#
static void Main(string[] args)
{
   new Build()
      .Parameter("server",arg=>server=arg)
      .Recognize(typeof(CustomerController))
      .Parse(args)
      .Invoke(Console.Out);

}
```

There is some simple syntax to extend this. To Set culture, TypeConverter et.c.

So you would invoke the method "Add" on the class "CustomerController" with the arguments id and name:

```cmd
CustomerConsoleApp.exe Customer Add --id 1234 --name Arne
```
