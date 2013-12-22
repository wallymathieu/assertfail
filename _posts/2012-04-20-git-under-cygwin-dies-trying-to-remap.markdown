---
layout: post
title:  "git under cygwin dies trying to remap dll"
date: 2012-04-20T09:38:00+02:00
categories: cygwin git msysgit
---

<h3>
cygwin unable to remap dll to same address as parent</h3>
<br><a href="http://yosanai.com/cygwin-unable-remap-dll-same-address-parent">http://yosanai.com/cygwin-unable-remap-dll-same-address-parent</a><br><br class="Apple-interchange-newline"><br>
Posted Fri, 04/24/2009 - 15:51 by Saravana Peruma...<br>
When you are working with Cygwin, sometimes you would get an error like this:<br><i><span style="background-color: black; color: lime;">"unable to remap some.dll to same address as parent someapp 4292 fork: child 3964 - died waiting for dll loading, errno 11"</span></i><br>
Then you would need to run rebaseall.<br>
In order to run it, close all you Cygwin windows. Make sure that all of the perl and cygwin processes/services are closed.<br>
Open a command prompt (windows command prompt) and go to your cygwin directory.<br>
From the root of your cygwin directory, execute <span style="background-color: black; color: white;">bin\ash.exe</span>.<br>
Ash (a unix shell) will start. Inside ash you then execute:<br><span style="background-color: black;"><span style="color: white;">bin/rebaseall</span></span><br>
Once it is done, exit and close the command prompt. If it still does not work even though you did the above: Reboot.<br><h3>
There are also related stackoverflow questions:</h3>
<a href="http://stackoverflow.com/questions/5014554/git-svn-error-under-cygwin">http://stackoverflow.com/questions/5014554/git-svn-error-under-cygwin</a><br><br><a href="http://superuser.com/questions/231590/running-rebaseall-on-cygwin">http://superuser.com/questions/231590/running-rebaseall-on-cygwin</a>
<br><div style="clear: both;"></div>