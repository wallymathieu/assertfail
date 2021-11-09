---
layout: post
title: Monorepo versus Polyrepo
date: 2021-11-05T19:15:31+01:00
---

Let us start by defining monorepo

- Keep multiple projects in a single source control system [1](#1)
- Acquire as many third-party and in-house dependencies as possible for a build from the same source-control repository/branch, and in the same update/pull/sync operation. [2](#2)
- Keep all teams in agreement on the versions of third-party and in-house dependencies via lock-step upgrades. [2](#2)

## Plausable restrictions

The point about keeping third-party binary dependencies in source control was popular in the .net world before the [NuGet](https://www.nuget.org/) and in the Java world before [Maven Repositories](https://maven.apache.org/guides/introduction/introduction-to-repositories.html). We have come to the point where it's preferable to avoid this practice. Let us assume that only source code and similar sources are stored.

## Language & infrastructure

Languages that do not have good package managers naturally lend themselves to creation of monorepos. The main languages that I've used that have this property are C and C++.

## Debugging

In order to debug binary packages that you don't have the source for some languages have support for different debug packages and source references. [3](#3) Even if these tools are available they might not work with your organisation source control or package repository.

If you write libraries for business code (spread domain knowledge in package artifacts that get referenced from an internal package repository), then having restrictions on how to debug the code can be a pain for developers.

## Painpoints

Matt Klein makes us aware about having tight coupling and performance in [Monorepos: Please don’t!](https://medium.com/@mattklein123/monorepos-please-dont-e9a279be011b).

### Tight coupling

You want to homogenise the use of internal or third party libraries. Is it OK for other teams that you refactor their code when they are busy with say a crunch and want to avoid unnecessary merge conflicts?

Does changes of internal or third party libraries imply a subtle change in behavior? Even if the code is well tested on its own, usage of the code can break. You might want to have a gradual increase in the usage of a new version of a library.

One reason why you want to transform multiple repositories to fewer repositories is that you have a [monolith in disguise](http://morningcoffee.io/monorepos-monoliths-in-disguise.html). Multiple services and libraries are changed for one issue in what should be one business subdomain.

### Performance

For very large repositories we see that organisations use source control systems that allow you to do "sparse checkouts" of only a subset of the repository since the amount of code takes too long to clone.

### Focus

Clear boundries borders that you don't need to cross can increase focus on a single business subdomain.

Being able to browse the history for the code of a business subdomain can allow people to know what's going on (too much noise drowns out the team).

### Ownership

Everybody has access to everything. Who reviews what?

## Conclusion

Should you have a single repository for a team? I think it makes sense if the team only works on one product/system and the choice suits the system and the team.

Probably you want to merge and split out repositories as time goes on. It's best to keep your options open and make a pragmatic choice for your team. Keeping separate repositories can make it clear that the source is supposed to be separate.

## References

#### [1]
Wikipedia [Monorepo](https://en.wikipedia.org/wiki/Monorepo)
#### [2]
trunkbaseddevelopment [Monorepos](https://trunkbaseddevelopment.com/monorepos/)
#### [3]
- [sourcelink](https://docs.microsoft.com/en-us/dotnet/standard/library-guidance/sourcelink)
- [symbol package](https://docs.microsoft.com/en-us/nuget/create-packages/symbol-packages-snupkg)
- [sourcelink issues](https://github.com/dotnet/sourcelink/issues)


