---
layout: post
title: Merging in svn
date: 2016-05-29T13:46:21+02:00
tags: svn
---

While working as a consultant at a company that uses svn, I needed to keep a branch in sync with the master branch. This turns out to be a lot of work.

Problem was that it was not possible to just clone the repository using git svn. The clone failed after a while (I think due to the long connection time). First you might want to read up on it from [this blog post](http://andy.delcambre.com/2008/03/04/git-svn-workflow.html).

The command I used was something like:

```
git svn clone -r 10327 --username=oskar.gewalli http://company.com/scm/svn/Project project  --stdlayout --prefix=svn/
```

In order to fetch changes I did:
```
git svn rebase 
```

And to push changes:
```
git svn dcommit
```

Since I could not clone the repository and get the full branches, I had to add branches manually. It took little bit of work but was described on [stackoverflow](http://stackoverflow.com/questions/296975/how-do-i-tell-git-svn-about-a-remote-branch-created-after-i-fetched-the-repo).


The value of this work is that merging branches is far easier in git compared to svn.