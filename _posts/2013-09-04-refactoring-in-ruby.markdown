---
layout: post
title:  "Refactoring in ruby"
date: 2013-09-04T22:07:00+02:00
tags: ruby unit-test
---

We have written a lot of ruby code in the project I'm currently working in. There is a lot of code to help manage, build and schedule the program. We started out simple enough. Just one folder with helper scripts. After 2 years we have built up support for a wide variety of tasks.

### Command line tools

We have used and abused ```$:.unshift File.dirname(__FILE__)``` and similar constructs far to much. This makes it hard to get a good overview of dependencies between files.

In order to get islands of related code we have turned to making local only gems. The gem structure helps to cut down on weird manipulations of the load path. It's easier to get an overview by having related files and their tests in a separate folder.

### Bundler

Bundler turns out to have a lot of nice tasks (a coworker told me about it):
```require 'bundler/gem_tasks'```

Looking at the bundler code helps when using the [GemHelper](https://github.com/bundler/bundler/blob/master/lib/bundler/gem_helper.rb) class. If we look at gem_tasks.rb we find:

```ruby
require 'bundler/gem_helper' 
Bundler::GemHelper.install_tasks
```

The standard format for gemspecs usually make use of git ls-files. We got a lot of error messages from bundler and switched to use Dir.glob.

### Rails app turns into gem

I've written a rails-app for a specific task. I started out with having most of the code in models, helpers in the rails app folder. This turned a bit sour after a while. In order to alleviate the code smell, I started moving the functionality into the lib folder. It turned out that we wanted to use the code in a different setting than as a web app. I moved the relevant tests and code from the lib folder into a new package/gem and added a dependency on this gem from the rails app.

We have since stopped maintaining the rails app, and it has been removed.
