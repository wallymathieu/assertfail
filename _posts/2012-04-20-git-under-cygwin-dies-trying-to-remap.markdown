---
layout: post
title:  "git under cygwin dies trying to remap dll"
date: 2012-04-20T09:38:00+02:00
tags: cygwin git msysgit
---


### cygwin unable to remap dll to same address as parent

[http://yosanai.com/cygwin-unable-remap-dll-same-address-parent](http://yosanai.com/cygwin-unable-remap-dll-same-address-parent)

> Posted Fri, 04/24/2009 - 15:51 by Saravana Peruma...
> When you are working with Cygwin, sometimes you would get an error like this:
> <i><span style="background-color: black; color: lime;">"unable to remap some.dll to same address as parent someapp 4292 fork: child 3964 - died waiting for dll loading, errno 11"</span></i>
> Then you would need to run rebaseall.
> In order to run it, close all you Cygwin windows. Make sure that all of the perl and cygwin processes/services are closed.
> Open a command prompt (windows command prompt) and go to your cygwin directory.
> From the root of your cygwin directory, execute <span style="background-color: black; color: white;">bin\ash.exe</span>.
> Ash (a unix shell) will start. Inside ash you then execute:
> <span style="background-color: black; color: white;">bin/rebaseall</span>
> Once it is done, exit and close the command prompt. If it still does not work even though you did the above: Reboot.

### There are also related stackoverflow questions:

<a href="http://stackoverflow.com/questions/5014554/git-svn-error-under-cygwin">http://stackoverflow.com/questions/5014554/git-svn-error-under-cygwin</a><br><br><a href="http://superuser.com/questions/231590/running-rebaseall-on-cygwin">http://superuser.com/questions/231590/running-rebaseall-on-cygwin</a>
