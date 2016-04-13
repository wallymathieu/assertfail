---
layout: post
title: path unshift dirname of file
date: 2015-08-31T14:17:46+02:00
tags: ruby
---

Instead of using:

~~~ ruby
$:.unshift File.dirname(__FILE__)
~~~

to add a folder to the path, a better way inside your ruby code is to use:

~~~ ruby
require_relative 'subfolder/file'
~~~

in order to require files. You can also use a relative path in require (i.e. './subfolder/file').



