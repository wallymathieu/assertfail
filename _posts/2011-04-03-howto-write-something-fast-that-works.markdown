---
layout: post
title:  "HOWTO write something FAST that works!"
date: 2011-04-03T15:18:00+02:00
categories: unit-test
---

<div dir="ltr" style="text-align: left;" trbidi="on">
<ol style="text-align: left;">
<li>Make sure that you're always doing the right thing (Erik Arnwald). Try to understand as much as possible of the domain you're working on.</li>
</ol>
<ul>
<li>Sometimes you do not need to any custom code but can use standard components coupled with some education of the customer. For instance a standard CMS module. (Carsten Hersom)</li>
</ul>
<li>Make sure to use stable and well tested third party tools and libraries for your core effort.  For instance. The guys maintaining Nhibernate have extensive test coverage of the library. Avoid any tool that is not either really stable and old (and is used by many) or has a good test coverage.</li>
<li>Make sure that everybody uses database versioning tool. Preferably some form of migrations. </li>
<li>Start by making a small part of your program from the bottom. </li>
<ol>
<li>Trim furiously in the specifications and in the code. Make sure to identify the key benefit for the customer and focus solely on implementing this part. Additional wishes and demands tends to change rapidly and might not be necesary at all. The most common reason to break of deadlines and malfunctions is too complex specifications which are changed after the project has been started. (Carsten Hersom)</li>
<li>Make sure to have test coverage of any part of the code you're unsure of how it works or any brittle parts. Things that are brittle is for instance the use of SqlCommand against stored procedures (SP). As the SP's are changed code may stop to work without you knowing it. Make sure to have tests of the connection between c# and the sql database. Make sure that your tests are as terse as possible. Don't be afraid to throw old tests away that are wrong and not needed. You can read about tests in the post: <a href="http://assertfail.blogspot.com/2011/03/why-automated-tests.html">why automed tests</a>.</li>
<li>Once <u>done</u> (as in it's tested) with the infrastructure you can start working on the gui. </li>
<li>The same criteria as for other tools apply to javascript frameworks and libraries.</li>
<li>Use javascript lint to your benefit. Change the rules according to your need. You can download an integrated version for visual studio. Make sure to change what it reports (and that it does not complain about third party js libraries).</li>
<li>Be really careful of hiding exceptions (catch the right exception). If something goes wrong, it should explode. It's really hard to find errors if you have written something like try{ ... } catch(Exception){}</li>
</ol>
<li>If you like static analysis use fxcop to your benefit. Turn off most of the crap. Make sure that fxcop only reports relevant information. If unsure, avoid using this tool.</li>
<li>Release as soon as possible so that others (customers and domain experts) can give you feedback. It's always better to have complete workflows in the gui (even if some of the functionality is faked). It helps the users and customers to visualize and provide better feedback. (Erik Arnwald)</li>
<li>Don't be afraid. If the functionality is to complex, try to understand the problem the functionality is supposed to solve. It might be that you can solve it with less complexity. If you're afraid of stuff breaking, write tests.</li>
<li>In order to avoid the time spent running integration tests, you might want setup a <a href="http://en.wikipedia.org/wiki/Continuous_integration">CI</a> environment like <a href="http://www.jetbrains.com/teamcity/">team city</a>. </li>
<li>In order to get people to contribute feedback on the current site/app you might want to consider automated deployments. This can help you when you need to deploy quickly for some reason (bugs). It can also help people unfamiliar with all the intricacies of a projects deployment to help with this activity. </li>
<li>Stay focused.</li>

<div>
You may ask: Why writing tests if time is short? The reason for this is that the time spent manually debugging and testing can be considerable. I've read estimates of the time spent in software development is mostly fixing bugs: Thus debugging and manually testing. </div>
<div>
<br>
</div>
<div>
Some people can write a working program really fast without tests and structure and with mostly duct tape and spit to keep it together. These people are few. Of the programmers I've met only a handful have this skill. For most of us it's not quick and dirty, it's just dirty. As one of my former coworkers (Mads) told me: Writing quick and dirty code is like taking a loan. There is always an interest that you need to pay. The longer you wait before refactoring the higher the cost.</div>
</div>
<div style="clear: both;"></div>