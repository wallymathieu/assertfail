---
layout: post
title:  "Modelbinding a complex entity framework/Linq to Sql model to asp.net mvc"
date: 2009-03-14T06:41:00+01:00
tags: asp.net_mvc  C# Entity_Framework Linq_to_Sql
---

For a couple of days now I've been trying to "ModelBind" a more complex model (based on the Entity framework)  to a controller action. The problems I've been having are mostly related to the amount of code for this task. I'm therefore thinking of ways to reduce the complexity. The main problem is that it's not directly possible to bind to ordinary EF/LS-graphs.

- *Separate object graph.* One solution could be to have a separate object graph for use in with the view. That seems more than wastefull since we want to edit everything on this page and thus end up having to maintain extra objects when we have the EF/LS ones.

- *A revised binding to the EF/LS objects.* If my modelbinder treated the EF/LS objects in the correct maner then my problems would be solved. Problem is though that I need connected objects in the binding. That implies a UpdateModel pattern with the object context visible from the controller. Not a beautiful solution though.

I've written a small asp.net mvc application with a simple (complex model). I've a main entity Smurf. The Smurf entity has several SmurfChild records related to it:

 ![smurf model](/img/2009-03-14-modelbinding-complex-entity-framework_model.gif){:height="320px" width="278px"}

The model binding I'm trying to do is the following:

~~~c#
public ActionResult EditAll_CustomBinder(
        [ModelBinder(typeof(SmurfListBinder))]
        IList<smurf> smurfs
        )
~~~

I'm editing a list of smurfs and the related smurf children in the view.
