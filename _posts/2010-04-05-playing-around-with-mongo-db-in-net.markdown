---
layout: post
title:  "Playing around with mongo db in .net"
date: 2010-04-05T15:51:00+02:00
tags: asp.net_mvc C# mongodb
---

Ever since I heard of the NoRM driver for MongoDB I had to try my hands on it. You can find it here:
[NoRM](http://github.com/atheken/NoRM) , [mongodb](http://www.mongodb.org/)

The first thing is setting up the server. I dropped the binaries into

```cmd
C:\\MongoDb\\
```

Next thing I created two batch files.
To start the db: start.bat

```cmd
C:\\MongoDb\\bin\\mongod.exe --dbpath C:\\MongoDb\\data --port 27000 --logpath C:\\MongoDb\\log\\mongodb.log --logappend
```

The other to access the mongo shell: shell.bat
C:\\MongoDb\\bin\\mongo.exe --port 27000

Next thing is creating a simple asp.net MVC app that uses MongoDB for storage.

My object of choice is Product:

```c#
public partial class Product
{
  public Product()
  {
    Id = ObjectId.NewObjectId();
  }
  [Column(IsPrimaryKey = true)]
  public virtual ObjectId Id
  {
    get {return _id;}
    set {_id = value;}
  }
...
}
```

 The attribute is for the editor template. Next thing is the controller. Here is the helper for connecting to the database:

```c#
  public class ServerHelper
  {
    public static Mongo GetServer()
    {
      return Mongo.Create("mongodb://localhost:27000/MongoMvc");
    }

    public static MongoCollection Collection()
    {
      return GetServer().GetCollection("products");
    }
  }
```

Note that you don't need to do a create database or collection.

Insert is straightforward. In order to list all "products" I used an empty Find on the collection. To update I did the following:

```c#
    [HttpPost,ActionName("Edit")]
    public ActionResult EditPost(ObjectId id)
    {
      var collection = ServerHelper.Collection();
      var product = collection.FindOne(new{ _id = id });
      UpdateModel(product);
      collection.UpdateOne(new { _id = id }, product);
      return RedirectToAction("Index");
    }
```

Looks interesting. I've not delved into any deeper parts than this yet. I could probably have done this without the additional configuration.
