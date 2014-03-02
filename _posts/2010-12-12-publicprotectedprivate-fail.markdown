---
layout: post
title:  "Public/protected/private fail?"
date: 2010-12-12T11:33:00+01:00
categories: c# visual_studio
---

How many times are you writing these keywords? For many of the things I write I don't feel that these keywords add to the readability of the code. It would be sweet to be able to specify on for example assembly level the default visibility of your code. Or perhaps some short version of the keywords? <br><br>
$ class Comment {<br>
 _ id; //private<br>
 $ Id { get{ return id;} set{ id=value;} } //public<br>
 @ someValue = "";//protected<br>
}<br><br>
Or let the visibility be govern by name convention if you set some flag in assemblyinfo.cs ? <br>
class Comment {<br>
 _id; //private<br>
 Id { get{ return id;} set{ id=value;} } //public<br>
 someValue = "";//protected<br>
}<br><br>
These keywords sometimes contribute to the noise in the application.<br><br>
Using a preprocessor you could get these features today, but that would not work well with the visual studio tooling.
<div style="clear: both;"></div>