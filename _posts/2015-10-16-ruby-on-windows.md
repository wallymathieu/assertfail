---
layout: post
title: ruby on windows
date: 2015-10-16T07:57:52+02:00
tags: ruby
---
I've had some trouble installing gems on windows instances using ```bundle install```. I had this problem first at ~2009. The problem is [missing certificates](https://gist.github.com/luislavena/f064211759ee0f806c88).

While this fix is correct, a quick and dirty approach is to make sure that your gem files have source http instead of https:

~~~ ruby
# A sample Gemfile
source "http://rubygems.org"

gem 'albacore'
gem 'nuget_helper'
~~~

This means that the communication to download gems from rubygems is not private.

