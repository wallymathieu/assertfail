---
layout: post
title: Running dotnet core 1.1 on appveyor and travis
date: 2017-01-29T09:05:29+01:00
---

I wanted to see the state of EntityFramework on core. Turns out that it works on other platforms than Windows! NHibernate worked on mono as well as Windows, and now Entity Framework has caught up with that. However, EF Core is still somewhat limited as a ORM. This should not matter much if you are writing relatively simple SQL (LINQ) and have few relationships (so that you have less of a need for more advanced constructs). Many business apps do fall into this category if the requirements are made simple and clear (one source of complexity is fuzzy requirements leading to confused code).

## appveyor

Running .net core on appveyor turned out to be quite easy. They have already installed .net core 1.1 on their servers. All you need to do is to run the dotnet commands.

## .net core official .travis documentation

The first thing I tried was to try out a configuration based on the [travis documentation](https://docs.travis-ci.com/user/languages/csharp/#Choosing-runtime-and-version-to-test-against) about running .net core on travis. This should work for a 1.0.0 version, however, I had depencies on core 1.1.0. Note that this type of configuration is also used by [Enrico Sada in the dotnet docs](https://github.com/dotnet/docs/blob/master/.travis.yml):

```
$ dotnet test
Project Tests (.NETCoreApp,Version=v1.1) was previously compiled. Skipping compilation.
The specified framework 'Microsoft.NETCore.App', version '1.1.0' was not found.
  - Check application dependencies and target a framework version installed at:
      /usr/share/dotnet/shared/Microsoft.NETCore.App
  - The following versions are installed:
      1.0.0
  - Alternatively, install the framework version '1.1.0'.
```

## Trying other versions of dotnet core on travis

I tried with a later travis dotnet version:

```
dotnet: 1.0.0-preview2.1-003155
```

This resulted in:

```
$ dotnet test
Project Tests (.NETCoreApp,Version=v1.0) was previously compiled. Skipping compilation.
The specified framework 'Microsoft.NETCore.App', version '1.1.0' was not found.
  - Check application dependencies and target a framework version installed at:
      /usr/share/dotnet/shared/Microsoft.NETCore.App
  - The following versions are installed:
      1.1.0-preview1-001100-00
  - Alternatively, install the framework version '1.1.0'.
```

## Trying the scripts from EF Core

I tried to run a setup based on the [.travis.yml in the EF repository](https://github.com/aspnet/EntityFramework/blob/dev/.travis.yml). The scripts failed while running locally, so I abandonded that attempt early (perhaps they need environment in the repository that I'm missing).

## Trying out scripts from blog

I tried running scripts found on [Andrew Locks blog](http://andrewlock.net/adding-travis-ci-to-a-net-core-app/). These failed with:

```
/home/travis/build/wallymathieu/entity-framework-studies/.dotnetcli/sdk/1.0.0-rc4-004706/NuGet.targets(210,5): warning MSB3202: The project file "/home/travis/build/wallymathieu/entity-framework-studies/Web/Web.xsproj" was not found. [/home/travis/build/wallymathieu/entity-framework-studies/entity-framework-studies.sln]
/home/travis/build/wallymathieu/entity-framework-studies/.dotnetcli/sdk/1.0.0-rc4-004706/NuGet.targets(210,5): warning MSB3202: The project file "/home/travis/build/wallymathieu/entity-framework-studies/Tests/Tests.xsproj" was not found. [/home/travis/build/wallymathieu/entity-framework-studies/entity-framework-studies.sln]
/home/travis/build/wallymathieu/entity-framework-studies/.dotnetcli/sdk/1.0.0-rc4-004706/NuGet.targets(97,5): warning : Unable to find a project to restore! [/home/travis/build/wallymathieu/entity-framework-studies/entity-framework-studies.sln]
```

and

```
/home/travis/build/wallymathieu/entity-framework-studies/Tests/Tests.xproj(7,3): error MSB4019: The imported project "/home/travis/build/wallymathieu/entity-framework-studies/.dotnetcli/sdk/1.0.0-rc4-004706/Microsoft/VisualStudio/v14.0/DotNet/Microsoft.DotNet.Props" was not found. Confirm that the path in the <Import> declaration is correct, and that the file exists on disk.
```

Probably due to being for a previous version of dotnet core.

## Trying out install instructions

Instead of trying out travis specific instructions I tried to copy the [instructions found for installing net core on ubuntu](https://www.microsoft.com/net/core#linuxubuntu). Since these instructions are probably maintained, they worked without a glitch. I ended up with this version of .travis.yml:

```
language: csharp
sudo: required
dist: trusty
addons:
  apt:
    packages:
    - gettext
    - libcurl4-openssl-dev
    - libicu-dev
    - libssl-dev
    - libunwind8
    - zlib1g
env:
  global:
    - DOTNET_SKIP_FIRST_TIME_EXPERIENCE: true
    - DOTNET_CLI_TELEMETRY_OPTOUT: 1
mono:
  - latest
os:
  - linux
before_install:
  - sudo sh -c 'echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ trusty main" > /etc/apt/sources.list.d/dotnetdev.list'
  - sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 417A0893
  - sudo apt-get update
install:
  - sudo apt-get install dotnet-dev-1.0.0-preview2.1-003177
script:
  - dotnet restore
...
```

