---
layout: post
title:  "What's wrong with SharePoint"
date: 2010-11-27T00:17:00+01:00
tags: whats_wrong sharepoint
---

Whats wrong with SharePoint
from a developer point of view?

1. Packages
    * It's somewhat unreliable in it's deployment of files.
    * Takes a lot of time to install/uninstall a package.
    * Not a modern approach to package management. Its basically a cab file with files and xml describing it.
2. Configuration
    * How do you test the deployment of configuration?
    * How does it work exactly? You have to observe the result ... It only works when you use it the right way and you dont get much in error messages.
    * Deploying the right way is frikkin hard. But, if you expect the tools for sp to work without crashing your site, you better do it the right way.
3. From line of code to result. Could this be described as lead time of changing a line of code to viewing the results of it in the interface?

* 10 min or more if youre unlucky. This means that the roundtrip is not comparable to a clean site in asp.net.

* Not even a mediocre web platform. Its written for intranet. This shows.

* Running code in SharePoint context can be up to 10 times slower for the same dll.

* Security. Some of the problems with SharePoint are related to security. It adds to the complexity.

* You need to mark your controls as SafeControls.  
* Can get you thinking that GAC deployment is a good idea. Also you need to be aware of asp.net security configuration and what you may do. If you put things in GAC without very good reason do not complain if visual studio crashes, your projects use obsolete versions of your code, your build crashes.
* Identity Impersonate... 

* Huge. There looks like there at least 3 ways of doing things, and they are all for slightly different scenarios. This is an issue. You have to learn a lot of SharePoint concept in order to get the job done. You have to do extra work to introduce for istance an asmx.
    This is not helped by asp.net being a leaky abstraction for producing web sites/apps. It can work well if you accept the behaviour and limitations of of asp.net. Problem is that it's not often that people are satisfied with this. Thus it may help to move to asp.net mvc for a simpler more web centric view.
* If you're supposed to develop web, it's not a good experience.

Compare this to a regular asp.net web app/ site.

How do you improve the experience?

Conventional wisdom apply:

1. Testing your logic using automatic tests is valuable. Even more so since any changes take a lot of time to enter into SharePoint.
2. If you can simplify by faking SharePoint functionality
    * Writing web in regular web and move it using merge or generation
    * Write simpler versions of SharePoint classes.

* Use fewer dlls. Use ilmerge or consider fewer projects in your solution. Good idea anyway since its good practice to have few projects in visual studio. In .net its best practice to have few dll:s. In visual studio it's [better](http://stackoverflow.com/questions/1828309/does-having-more-projects-in-your-visual-studio-increase-compile-time) to have few projects in your solution. You can solve this by having good build scripts and small sub solutions (may not be a good idea if you do not have a lot of code).
* If possible avoid putting things in the GAC. It can be useful, but not for everything. You can put dll:s in the [bin folder of SharePoint](http://stackoverflow.com/questions/1754006/is-sharepoint-local-bin-deployment-possible).
* Automate as much as possible.

* Write build scripts.
* There is a [sample macro](http://stackoverflow.com/questions/1000104/visual-studio-configure-debug-to-attach-to-process) for attaching to a process.

* If there are no logs or anything to help you with what's going wrong: You might need to use advanced tools like [Process Monitor](http://technet.microsoft.com/en-us/sysinternals/bb896645.aspx).

Some other helpful tips may be:

1. [Wspbuilder](http://wspbuilder.codeplex.com/) can be a good starting point. It can help you by automatically registring safe controls. Ms commerce extendability project can show you how to do it without the tool. Some of the uses for this tool might become obsolete with the introduction of Visual Studio 2010 and SharePoint 2010 (might not save your bacon though). I've not tried this, only read it on blogs. It might help you to understand what the tools generate.
2. Be pragmatic when it comes to configuration. Dont hesitate to use a merge program when your configuration feature fails. Unless of course your client will use the wsp on a SharePoint farm. 
3. Put your code behind wcf services so that the configuration and context is outside of SharePoint. Less configuration helps. Also the separation of your code and the executing context in SharePoint help you configure security easier.
4. Don't be stressed if it takes time. Read up on the things your working with (try to ignore the rest).
