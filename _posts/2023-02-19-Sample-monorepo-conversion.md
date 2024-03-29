---
layout: post
title: Sample monorepo conversion
date: 2023-02-19T13:47:28+02:00
tags: architecture
---

## Project with many repositories

This is a continuation of [Monorepo versus Polyrepo](https://assertfail.gewalli.se/2021/11/05/Monorepo-versus-Polyrepo.html).

This is a story about a project I worked on. We had some pain points related to many different source repositories.

- Shared business domain library that contained shared business types
- Shared library with a base parent entity (with common behavior)
- Many services that dealt with different subdomains that uses a few shared libraries
- Very complicated requirements with lots of nuances
- Different persons had different areas of expertise
- Generally the services are loose coupled
- Thought out structure for each service and uniform style

At first, we thought that the shared code would stabilize. This did not happen. This meant a large number of pull requests with only package version changes.

We wanted to change code in the shared libraries along new core requirements.
We had confusion around package versions due to the sheer amount of package changes.
During retrospectives the team expressed frustration with the amount of unnecessary work.

## Time to merge

We decided to merge the repositories into a shared repository for the .net code. This meant that we changed the [NuGet packages](https://en.wikipedia.org/wiki/NuGet) to [project references](https://learn.microsoft.com/en-us/dotnet/core/tools/dotnet-add-reference).

We also needed to support work on two major branches. For this particular business, there is a need to get legal to sign off on any major release. When we develop a major version we also bugfix the previous major version.

## Git magic

We looked into using [git submodule](https://git-scm.com/docs/git-submodule). We decided that it was not the right choice for the team: everyone would need to learn how to use it. Git submodule requires the team to learn additional commands to do [pull and checkout](https://stackoverflow.com/questions/1030169/pull-latest-changes-for-all-git-submodules) in the main repository.
We noticed was that you can use [git subtree](https://www.atlassian.com/git/tutorials/git-subtree) in similar way as git submodule. Difference is that only a few persons need to learn the extra commands.

You can fetch changes from different repositories into a merged repository.

## Builds builds and builds

Our CI triggered a build for every new branch for every service.

## Conclusion

Making changes to shared libraries become easier.
We could use existing tools to make the transition (git subtree).
