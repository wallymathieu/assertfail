---
layout: post
title:  "What's wrong with SharePoint"
date: 2010-11-27T00:17:00+01:00
categories: whats_wrong sharepoint
---

<div dir="ltr" style="text-align: left;" trbidi="on">
<span class="Apple-style-span" style="font-size: x-large;">Whats wrong with SharePoint</span><br><span class="Apple-style-span" style="font-size: large;">from a developer point of view?</span><br><ol>
<li>Packages<br><ul>
<li>It's somewhat unreliable in it's deployment of files.</li>
<li>Takes a lot of time to install/uninstall a package.</li>
<li>Not a modern approach to package management. Its basically a cab file with files and xml describing it.</li>
</ul>
</li>
<li>Configuration<br><ul>
<li>How do you test the deployment of configuration?</li>
<li>How does it work exactly? You have to observe the result ... It only works when you use it the right way and you dont get much in error messages.</li>
<li>Deploying the right way is frikkin hard. But, if you expect the tools for sp to work without crashing your site, you better do it the right way.</li>
</ul>
</li>
<li>From line of code to result. Could this be described as lead time of changing a line of code to viewing the results of it in the interface?</li>
</ol>
<ul>
<li>10 min or more if youre unlucky. This means that the roundtrip is not comparable to a clean site in asp.net.</li>
</ul>
<li>Not even a mediocre web platform. Its written for intranet. This shows. <br>
</li>
<li>Running code in SharePoint context can be up to 10 times slower for the same dll.<br>
</li>
<li>Security. Some of the problems with SharePoint are related to security. It adds to the complexity.</li>
<ul>
<li>You need to mark your controls as SafeControls.  </li>
<li>Can get you thinking that GAC deployment is a good idea. Also you need to be aware of asp.net security configuration and what you may do. If you put things in GAC without very good reason do not complain if visual studio crashes, your projects use obsolete versions of your code, your build crashes.</li>
<li>Identity Impersonate... </li>
</ul>
<li>Huge. There looks like there at least 3 ways of doing things, and they are all for slightly different scenarios. This is an issue. You have to learn a lot of SharePoint concept in order to get the job done. You have to do extra work to introduce for istance an asmx.<br>
This is not helped by asp.net being a leaky abstraction for producing web sites/apps. It can work well if you accept the behaviour and limitations of of asp.net. Problem is that it's not often that people are satisfied with this. Thus it may help to move to asp.net mvc for a simpler more web centric view.</li>
<li>If you're supposed to develop web, it's not a good experience.</li>

<br>
Compare this to a regular asp.net web app/ site.<br><br><span class="Apple-style-span" style="font-size: x-large;">How do you improve the experience?</span><br><br><span class="Apple-style-span" style="font-size: large;">Conventional wisdom apply:</span><br><ol>
<li>Testing your logic using automatic tests is valuable. Even more so since any changes take a lot of time to enter into SharePoint.</li>
<li>If you can simplify by faking SharePoint functionality</li>
</ol>
<ul>
<li>Writing web in regular web and move it using merge or generation</li>
<li>Write simpler versions of SharePoint classes.</li>
</ul>
<li>Fewer dlls. Use ilmerge or consider fewer projects in your solution. Good idea anyway since its good practice to have few projects in visual studio. In .net its best practice to have few dll:s. In visual studio it's <a href="http://stackoverflow.com/questions/1828309/does-having-more-projects-in-your-visual-studio-increase-compile-time">better</a> to have few projects in your solution. You can solve this by having good build scripts and small sub solutions (may not be a good idea if you do not have a lot of code).</li>
<li>If possible avoid putting things in the GAC. It can be useful, but not for everything. You can put dll:s in the <a href="http://stackoverflow.com/questions/1754006/is-sharepoint-local-bin-deployment-possible">bin folder of SharePoint</a>.</li>
<li>Automate as much as possible. </li>
<ul>
<li>Write build scripts. </li>
<li>There is a <a href="http://stackoverflow.com/questions/1000104/visual-studio-configure-debug-to-attach-to-process">sample macro</a> for attaching to a process.</li>
</ul>
<li>If there are no logs or anything to help you with what's going wrong: You might need to use advanced tools like <span class="Apple-style-span" style="-webkit-border-horizontal-spacing: 2px; -webkit-border-vertical-spacing: 2px; border-collapse: collapse; color: #333333; font-family: 'trebuchet ms', verdana, arial, sans-serif; font-size: 13px; line-height: 18px;"><a href="http://technet.microsoft.com/en-us/sysinternals/bb896645.aspx" style="color: #3366cc; font-weight: bold;">Process Monitor</a>.</span>
</li>

<div>
<span class="Apple-style-span" style="font-size: large;">Some other helpful tips may be:</span>
</div>
<ol>
<li>
<a href="http://wspbuilder.codeplex.com/">Wspbuilder</a> can be a good starting point. It can help you by automatically registring safe controls. Ms commerce extendability project can show you how to do it without the tool. Some of the uses for this tool might become obsolete with the introduction of Visual Studio 2010 and SharePoint 2010 (might not save your bacon though). I've not tried this, only read it on blogs. It might help you to understand what the tools generate.</li>
<li>Be pragmatic when it comes to configuration. Dont hesitate to use a merge program when your configuration feature fails. Unless of course your client will use the wsp on a SharePoint farm. </li>
<li>Put your code behind wcf services so that the configuration and context is outside of SharePoint. Less configuration helps. Also the separation of your code and the executing context in SharePoint help you configure security easier.</li>
<li>Don't be stressed if it takes time. Read up on the things your working with (try to ignore the rest).</li>
</ol>
</div>
<div style="clear: both;"></div>