---
layout: post
title: Bundler.with_clean_env
date: 2014-06-25T07:36:52+02:00
tags: ruby
---

Using ruby is kind of easy in the beginning. We started by having a folder of loose scripts. This turned a bit messy after a while. By moving these to separate gems we got some needed structure. Many of the programmers complained about globally installed gems (i.e. our local gems). In order to get a predictable executing environment we started to leverage bundler more and more. Turns out that there is a gotcha: Executing a bundle exec script inside a bundle exec script. The inside script will inherit the environment from the outer script. In order to avoid this you can use:

    Bundler.with_clean_env do
        ...
    end

This method is not documented, but it really should be (I'll do it if I find time).  
