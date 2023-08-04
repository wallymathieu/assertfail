---
layout: post
title: Installing build server
date: 2014-11-28T11:11:37+02:00
tags: teamcity sql-server
---

So, for the N-th time I'm helping out by configuring a build server. This time it was a bit different since we where restoring an old build teamcity server and agent from a crashed server.

There where some gothas as usual.

In order to restore teamcity we had to do some digging to find the data directory .

## TeamCity data

If you look in the "teamcity-server.log" you can find how the server was started last time. From that we could conclude the old TEAMCITY_DATA_PATH.
We took that directory and zip:ed it. Minus the cache, since windows zip freaked out about one the name of one of our coworkers: Michał Łusiak.

We made sure to set the system Environment variable:

~~~
TEAMCITY_DATA_PATH
~~~

to where we want teamcity to keep the data.

## SQL server

From the teamcity configuration we could deduce how it connected to SQL server.

SQL server was installed with only database engine and management studio.

When SQL was installed we only enabled windows authentication. Since teamcity connects through a tcp port, it started complaining about not being able to connect even though we had attached the old database added the expected user.

If we tried to connect the same was as teamcity through the command line tool "sqlcmd" we could more quickly iterate over the configuration.
The first problem was that sqlcmd could not connect to the expected port.
In SQL Server configuration manager we had to enter the sub section "SQL server network configuration" and enable tcp.
This got us a bit further. Now our problem was that the user could not connect with the user.
We had created a user under main security in SQL server with the correct password. Problem was that the attached database still had a user with the same name. We removed that user and did "associate user with database". We also needed to make sure that that user had the same permissions set as before.

Ok, so now we could log on to teamcity using our old accounts. Great!

The builds are failing because teamcity could not access the source control!

Easy fix, just need to add the private ssh keys to the correct folder so that teamcity can access private repositories.

## Msbuild

So a lot of the builds where failing because msbuild was not installed. How do you install msbuild without visual studio? Turns out stackoverflow knows the answer:
http://stackoverflow.com/questions/2567018/installing-msbuild-4-0-without-visual-studio-2010

You need the SDK.

I noticed that some of the builds where failing due to missing AL.exe (assembly linker). I installed the SDK associated with the version of windows installed Win2008. I forgot to check the error message closer. It was complaining about not finding "v8.0A" if you look at the error message. I had installed an earlier version if you look at the registry settings.

~~~cmd
C:\Windows\Microsoft.NET\Framework\v4.0.30319\Microsoft.Common.targets(2863,5): error MSB3086:
  Task could not find "AL.exe" using the SdkToolsPath "" or the registry key "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft SDKs\Windows\v8.0A\WinSDK-NetFx40Tools-x86". Make sure the SdkToolsPath is set and the tool exists in the correct processor specific location under the SdkToolsPath and that the Microsoft Windows SDK is installed
~~~

So I needed to install another SDK, the one called "Windows 8 SDK".

The names of the SDK's are a bit confusing.

Another project tried to build a web site. It was failing due to missing an imported msbuild targets file.

~~~cmd
WebSite.csproj(190,3): error MSB4019: The imported project "C:\Program Files (x86)\MSBuild\Microsoft\VisualStudio\v12.0\WebApplications\Microsoft.WebApplication.targets"
 was not found. Confirm that the path in the <Import> declaration is correct, and that the file exists on disk.
~~~

The common solution here is to copy the targets for web applications from a developer machine in order to get these targets. They really should be part of a nuget package or available as a separate download.

## Next day

Next day we ran into trouble with using port 80 for teamcity. Probably because the machine had slept during the night ;) . Turns out "system" is binding on port 80:

~~~Powershell
netstat -anbo  | where {$_.contains("80")}
~~~

When we searched to find some answer we found [stackoverflow](http://stackoverflow.com/questions/12492025/windows-8-nt-kernel-and-system-using-port-80).
Turns out "World Wide Web Publishing Service" is listening on port 80.
Why? It looks like it installs when adding ".net 3.5.1" as a feature to windows. We removed the web server role.

