---
layout: post
title:  "Using travis for mono"
date: 2014-03-02T12:24:00+01:00
categories: c# mono albacore rake
---

In order to setup ci for open source targeting c# projects I looked into using travis. There is a solution on [stackoverflow](http://stackoverflow.com/questions/16751772/how-do-i-use-travis-ci-with-c-sharp-or-f). The post got me started. Turns out that there are some problems with using nuget packages for mono using xbuild (Path.Combine in the msbuild file NuGet.targets is not supported yet). I patched [NuGet.targets](https://github.com/wallymathieu/isop/blob/master/src/.nuget/NuGet.targets) to accept parameters (thus I can supply the correct paths using albacore).

I've added the variable PackagesConfig to all the csproj files in the solutions:

        <PackagesConfig>$(ProjectDir)/packages.config</PackagesConfig>

The following code is what I'm using to build isop on mono:

          desc "build isop on mono"
          xbuild :build do |msb|
            solution_dir = File.join(File.dirname(__FILE__),'src')
            nuget_tools_path = File.join(solution_dir, '.nuget')
            msb.properties :configuration => :Debug, 
              :SolutionDir => solution_dir,
              :NuGetToolsPath => nuget_tools_path,
              :NuGetExePath => File.join(nuget_tools_path, 'NuGet.exe'),
              :PackagesDir => File.join(solution_dir, 'packages')
            msb.targets :rebuild
            msb.verbosity = 'quiet'
            msb.solution = File.join('.','src',"Isop.sln")
          end

