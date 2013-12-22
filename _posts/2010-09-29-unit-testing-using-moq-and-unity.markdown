---
layout: post
title:  "Unit testing using Moq and Unity Container"
date: 2010-09-29T20:07:00+02:00
categories: c# dependency injection moq unit-test unity
---

I have had troubles writing unit tests for classes with a lot of dependencies. The reason for this is that the initialization of the state for my test code would look like:<br>
[Setup]<br>
public void Setup()<br>
{<br>
   stub1 = new Mock<isomething1>();</isomething1><br>
...<br>
  stub20 = new Mock<isomething20>();</isomething20><br>
  mock = new Mock<imockable>();</imockable><br>
...// Setup mock and stub behavior<br>
  classToTest = new TypeOfClass( /*a lot of code*/);<br>
}<br><br>
This isn't very maintainable. How do we make this easier to maintain? I've introduced a helper class that initializes most of the interfaces to stubs of the form Mock<itype>. Then these stubs can be added to <a href="http://unity.codeplex.com/">Unity</a>. Thus the setup will be reduced to:</itype><br><br><div style="margin-bottom: 0px; margin-left: 0px; margin-right: 0px; margin-top: 0px;">[Setup]</div>
<div style="margin-bottom: 0px; margin-left: 0px; margin-right: 0px; margin-top: 0px;">public void Setup()</div>
<div style="margin-bottom: 0px; margin-left: 0px; margin-right: 0px; margin-top: 0px;">{</div>
<div style="margin-bottom: 0px; margin-left: 0px; margin-right: 0px; margin-top: 0px;">  container = new UnityContainerTestHelper();</div>
<div style="margin-bottom: 0px; margin-left: 0px; margin-right: 0px; margin-top: 0px;">  container.RegisterStubs();//Registers a lot of interfaces using <a href="http://code.google.com/p/moq/">Moq </a>
</div>
<div style="margin-bottom: 0px; margin-left: 0px; margin-right: 0px; margin-top: 0px;">  container.RegisterMock<imockable>();</imockable>
</div>
<div style="margin-bottom: 0px; margin-left: 0px; margin-right: 0px; margin-top: 0px;">...// Setup mock and stub behavior</div>
<div style="margin-bottom: 0px; margin-left: 0px; margin-right: 0px; margin-top: 0px;">  container.RegisterType<typeofclass>();</typeofclass>
</div>
<div style="margin-bottom: 0px; margin-left: 0px; margin-right: 0px; margin-top: 0px;">  classToTest = container.Resolve<typeofclass>();</typeofclass>
</div>
<div style="margin-bottom: 0px; margin-left: 0px; margin-right: 0px; margin-top: 0px;">}</div>
<div style="margin-bottom: 0px; margin-left: 0px; margin-right: 0px; margin-top: 0px;">The main thing here is that I'm the dependency injection container do the work. People have told me that dependency injection would help when testing. It does, but I've not seen examples of the use of a dependency injection container. If you have better ideas how this should be done, please post comments.</div>
<div style="clear: both;"></div>