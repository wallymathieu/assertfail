---
layout: post
title: Monorepo conversion continued
date: 2025-05-07T16:06:37+00:00
---

This is a continuation of [Sample monorepo conversion](https://assertfail.gewalli.se/2023/02/19/Sample-monorepo-conversion.html).

Since then we have learned some lessons. Also note that the monorepo conversions we have done have been of closed source code that we found was either tightly coupled or that we wanted to introduce tighter coupling between components without the overhead of shared libraries.

## Git Subtree

### Subtree the good parts

The good parts about using git subtree is that you can use regular `git merge` commands from old branches before the code became a monorepo. This is neat if you want to avoid a coordinated code freeze for when the conversion is done.

In the conversions we wanted to keep the history in order for change tracking to work.

### Subtree the bad parts

On Azure DevOps the blame feature [looks messed up](https://developercommunity.visualstudio.com/t/Azure-DevOps-Blame-does-not-show-the-s/10898153) while on GitHub and in Visual Studio blame shows what you would expect. Some of the links to merges also got messed up because we moved the repositories from the project into separate archive project. The links in Azure DevOps tasks got broken so they show up red. This is not so much a subtree issue as it is that we missed some of the details during the conversion. That Azure DevOps does not handle blame, is not really the fault of subtree.

You will have huge merge commits done by whoever got tasked with doing the conversion. These show up in history can look kind of ugly if you browse the commit history. Though to be honest, it is not that big of an issue.  

## Enter git-filter-repo

By using [git-filter-repo](https://github.com/newren/git-filter-repo) you can rewrite the git history to make it look like your files have always been in a conveniently named subfolder of the monorepo.

```sh
cd sub-project-a
git filter-repo --to-subdirectory-filter ProjectA
cd ..
cd mono-repository
git remote add -f sub-project-a ../sub-project-a
git merge --allow-unrelated-histories sub-project-a/master
git remote remove sub-project-a
```

### filter-repo good parts

We get a nicer looking history. The blame functionality in our current git host works.

### filter-repo the bad parts

After rewriting history, you cannot do a regular git merge with old branches. You might need to recreate your changes by doing format patch in git.

## Conclusion

Going towards a monorepo is not without hiccups. The pain points shared above are kind of minor. It did cause some confusion when one person tried looking for the commit when a feature got introduced and found what looked like truncated history in Azure DevOps. In a few years, perhaps this will be fixed by the Azure DevOps team.
