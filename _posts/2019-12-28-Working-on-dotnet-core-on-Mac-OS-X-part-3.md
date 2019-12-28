---
layout: post
title: Working on dotnet core on Mac OS X part 3
date: 2019-12-28T18:29:08+01:00
tags: core dotnet
---

After writing the [previous posts](http://assertfail.gewalli.se/2018/09/05/Working-on-dotnet-core-on-Mac-OS-X-part-2.html) about getting some of the infrastructure working for non Windows systems, I've seen better ways of getting it to work. Instead of using a netfx.props file, you can use a [Directory.Build.props](https://docs.microsoft.com/en-us/visualstudio/msbuild/customize-your-build?view=vs-2019) with platform specific configuration as seen [in for instance FSharp.Compiler.Service](https://github.com/fsharp/FSharp.Compiler.Service/blob/08daf6d5a0abb62c01a475ea442c2996b0e79335/FSharpBuild.Directory.Build.props#L39-L54):

```xml
<Project>

  <!-- mono -->
  <PropertyGroup Condition="'$(OS)' == 'Unix'">
    <MonoRoot Condition="'$(MonoRoot)' == '' and $([MSBuild]::IsOsPlatform('Linux'))">/usr</MonoRoot>
    <MonoRoot Condition="'$(MonoRoot)' == '' and $([MSBuild]::IsOsPlatform('OSX'))">/Library/Frameworks/Mono.framework/Versions/Current</MonoRoot>
    <MonoLibFolder>$(MonoRoot)/lib/mono</MonoLibFolder>
    <MonoPackaging Condition="$(TargetFramework.StartsWith('net4'))">true</MonoPackaging>
    <FrameworkPathOverride Condition="'$(TargetFramework)' == 'net45'">$(MonoLibFolder)/4.5-api</FrameworkPathOverride>
    <FrameworkPathOverride Condition="'$(TargetFramework)' == 'net451'">$(MonoLibFolder)/4.5.1-api</FrameworkPathOverride>
    <FrameworkPathOverride Condition="'$(TargetFramework)' == 'net452'">$(MonoLibFolder)/4.5.2-api</FrameworkPathOverride>
    <FrameworkPathOverride Condition="'$(TargetFramework)' == 'net46'">$(MonoLibFolder)/4.6-api</FrameworkPathOverride>
    <FrameworkPathOverride Condition="'$(TargetFramework)' == 'net461'">$(MonoLibFolder)/4.6.1-api</FrameworkPathOverride>
    <FrameworkPathOverride Condition="'$(TargetFramework)' == 'net462'">$(MonoLibFolder)/4.6.2-api</FrameworkPathOverride>
    <FrameworkPathOverride Condition="'$(TargetFramework)' == 'net47'">$(MonoLibFolder)/4.7-api</FrameworkPathOverride>
    <FrameworkPathOverride Condition="'$(TargetFramework)' == 'net471'">$(MonoLibFolder)/4.7.1-api</FrameworkPathOverride>
    <FrameworkPathOverride Condition="'$(TargetFramework)' == 'net472'">$(MonoLibFolder)/4.7.2-api</FrameworkPathOverride>
  </PropertyGroup>

</Project>
```

Another stumble has been that the nuget version on Ubuntu [is a bit old](https://stackoverflow.com/a/40209368). There are some ways around this, one easy way is to include a NuGet.config with both v2 and v3 feeds:

```xml
<configuration>
 <packageSources>
    <!--To inherit the global NuGet package sources remove the <clear/> line below -->
    <clear />
    <add key="nuget" value="https://api.nuget.org/v3/index.json" />
    <add key="nuget v2" value="https://www.nuget.org/api/v2" />
 </packageSources>
</configuration>
```
