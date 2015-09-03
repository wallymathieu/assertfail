---
layout: post
title: Build tools and package managers for .net
date: 2015-08-27T12:49:54+02:00
tags: rake paket gulp grunt fake
---

# What criteria do I use

I prefer for the build tool to work on both \*nix and windows. I do some of the .net coding on os x.

# If you are coding .net

## What package manager to use?

Right now there is NuGet. There is no good reason why you should deviate from using that format. However, you can choose to use NuGet.exe, NuGet in visual studio with packages.config files or use [paket](https://github.com/fsprojects/Paket) with 'paket' files.

Paket assumes that you want to have the same version of a package in all your projects in a solution. There is also a bootstrapper so that you don't need to install NuGet.exe on you build environment or add it to the repository (the paket.bootstrapper is only 27.5KB). Paket and [FAKE](http://fsharp.github.io/FAKE/) makes a nice package (an example can be found [here](https://github.com/wallymathieu/CustomerService/tree/master/suave)).

## What build tool to use?

I would generally unless there is some good reason avoid writing msbuild files. They are better suited to describe projects (csproj). 

### Gulp it's Grunt 

Since there is a lot of tools available for web developers that leverage grunt, many .net developers use grunt. It works, the api is a bit odd (json can be used to configure tasks). If you code js for other reasons, then the callbacks will probably not bother you. Note that there is another js build tool called gulp. Gulp is smaller and more focused on streaming builds (if you have looked at the ideas from reactive extensions you will find it familiar).

I've tried to use grunt. Node is quite easy to install on windows.

### Rake

I prefer to use ruby's make like tool rake for building open source c# apps since I usually have ruby installed wherever I work. Rake has some nice syntax that looks quite clean. It requires you to know some ruby though.

Usually when using ruby you will want to use [bundler](http://bundler.io/) to manage dependencies.

### Faking it?

Fake is a build tool where you write f# scripts. For f#-project this feels like a nice way to go. Fake is delivered by NuGet (so you won't need anything extra installed). It requires you to know some f#.

It works well under mono. I've not had any troubles with it.

The syntax is a bit unfamiliar, but that can be the case with f# written APIs (using operators like ==> or  >>=).

### PSake

Writing build scripts in powershell. This makes a lot of sense. Many times when you write build scripts, you are scripting windows servers as well; so you will have some experience using powershell. However, powershell is a bit of an odd language compared to many other common languages.

If you are doing windows only work, then this tool is valid.

### The Cake is alive? 

There are many different c# build tools. The most popular right now looks to be [Cake](https://github.com/cake-build/cake). You don't have to install cscript in order to [Cake](https://github.com/cake-build/cake) or [Nake](https://github.com/yevhen/Nake), but can download a .net exe from NuGet. You can use this exe to execute build script files. [Sake](https://github.com/sakeproject/sake) is installed via chocolatey. Cake looks more mature now, so it can be an option for developers mostly familiar with c#.

I've not tried Cake that much, so I don't know how well it handles under mono. 


