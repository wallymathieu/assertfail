# assertfail

## Installing python environment

- Install python 3
- On windows add C:\PythonX\Scripts to environment path
- ```pip3 install -r requirements.txt```

## Installing ruby environment

- Install ruby
- ```gem install bundler```
- ```bundle install```

you might need to do the following:

```sh
gem install bundler -v "$(grep -A 1 "BUNDLED WITH" Gemfile.lock | tail -n 1)"
```

when you get [can't find gem bundler with executable bundle](https://bundler.io/blog/2019/05/14/solutions-for-cant-find-gem-bundler-with-executable-bundle.html)

## Comments

In order to add comments to a post, simply add a comment in the following manner in the yml post file:

```yml
title: Immutable classes in C#
date: 2020-01-26T17:42:35+01:00
tags: C#
comments:
  - author: Oskar
    content: How often do you really use them?
    date: 2020-01-26T17:42:35+01:00
```
