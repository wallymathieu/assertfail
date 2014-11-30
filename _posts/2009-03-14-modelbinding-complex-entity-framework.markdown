---
layout: post386
title:  "Modelbinding a complex entity framework/Linq to Sql model to asp.net mvc"
date: 2009-03-14T06:41:00+01:00
tags: asp.net_mvc c# Entity_Framework Linq_to_Sql
---

For a couple of days now I've been trying to "ModelBind" a more complex model (based on the Entity framework)  to a controller action. The problems I've been having are mostly related to the amount of code for this task. I'm therefore thinking of ways to reduce the complexity. The main problem is that it's not directly possible to bind to ordinary EF/LS-graphs.<br><br><ol>
<li>
<span style="font-weight: bold;">Separate object graph.</span> One solution could be to have a separate object graph for use in with the view. That seems more than wastefull since we want to edit everything on this page and thus end up having to maintain extra objects when we have the EF/LS ones.</li>
<li>
<span style="font-weight: bold;">A revised binding to the EF/LS objects.  </span>If my modelbinder treated the EF/LS objects in the correct maner then my problems would be solved. Problem is though that I need connected objects in the binding. That implies a UpdateModel pattern with the object context visible from the controller. Not a beautiful solution though.</li>
</ol>I've written a small asp.net mvc application with a simple (complex model). I've a main entity Smurf. The Smurf entity has several SmurfChild records related to it:<br><br><br><a onblur="try {parent.deselectBloggerImageGracefully();} catch(e) {}" href="http://3.bp.blogspot.com/_dL5yeVtwO2s/SbzArzcRa4I/AAAAAAAAAkw/0e3qczG5dGQ/s1600-h/model.gif"><img style="margin: 0pt 10px 10px 0pt; float: left; cursor: pointer; width: 320px; height: 278px;" src="http://3.bp.blogspot.com/_dL5yeVtwO2s/SbzArzcRa4I/AAAAAAAAAkw/0e3qczG5dGQ/s320/model.gif" alt="" id="BLOGGER_PHOTO_ID_5313333519166040962" border="0"></a><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>The model binding I'm trying to do is the following:<br><span style="font-size:85%;">public ActionResult EditAll_CustomBinder([ModelBinder(typeof(SmurfListBinder))]IList<smurf> smurfs)<br></smurf></span>I'm editing a list of smurfs and the related smurf children in the view.
<div style="clear: both;"></div>