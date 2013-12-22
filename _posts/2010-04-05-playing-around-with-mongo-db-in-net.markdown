---
layout: post
title:  "Playing around with mongo db in .net"
date: 2010-04-05T15:51:00+02:00
categories: asp.net mvc c# mongodb
---

Ever since I heard of the NoRM driver for MongoDB I had to try my hands on it. You can find it here:<br><a href="http://github.com/atheken/NoRM">NoRM</a> , <a href="http://www.mongodb.org/">mongodb</a><br><br>
The first thing is setting up the server. I dropped the binaries into <br>
C:\MongoDb\<br><br>
Next thing I created two batch files. <br>
To start the db: start.bat<br>
C:\MongoDb\bin\mongod.exe --dbpath C:\MongoDb\data --port 27000 --logpath C:\MongoDb\log\mongodb.log --logappend<br><br>
The other to access the mongo shell: shell.bat<br>
C:\MongoDb\bin\mongo.exe --port 27000 <br><br>
Next thing is creating a simple asp.net MVC app that uses MongoDB for storage.<br><br>
My object of choice is Product:<br><i>public partial class Product</i><br><i>{</i><br><i>public Product()</i><br><i>{</i><br><i>Id = ObjectId.NewObjectId();</i><br><i>}</i><br><i>[Column(IsPrimaryKey = true)]</i><br><i>public virtual ObjectId Id</i><br><i>{</i><br><i>get {return _id;}</i><br><i>set {_id = value;}</i><br><i>}</i><br><i>...</i><br><i>}</i><br>
 The attribute is for the editor template. Next thing is the controller. Here is the helper for connecting to the database:<br><i>  public class ServerHelper<br>
  {<br>
    public static Mongo GetServer()<br>
    {<br>
      return Mongo.Create("mongodb://localhost:27000/MongoMvc");<br>
    }<br><br>
    public static MongoCollection<product> Collection()<br>
    {<br>
      return GetServer().GetCollection<product>("products");<br>
    }<br>
  }</product></product></i><br><br>
Note that you don't need to do a create database or collection.<br><br>
Insert is straightforward. In order to list all "products" I used an empty Find on the collection. To update I did the following:<br>
    <i>[HttpPost,ActionName("Edit")]<br>
    public ActionResult EditPost(ObjectId id)<br>
    {<br>
      var collection = ServerHelper.Collection();<br>
      var product = collection.FindOne(new{ _id = id });<br>
      UpdateModel(product);<br>
      collection.UpdateOne(new { _id = id }, product);<br>
      return RedirectToAction("Index");<br>
    }</i><br><br><br>
Looks interesting. I've not delved into any deeper parts than this yet. I could probably have done this without the additional configuration.
<div style="clear: both;"></div>