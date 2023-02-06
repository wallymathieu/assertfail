---
layout: post
title: Running SQL Server on Docker with an M1/ARM CPU
date: 2023-02-06T19:46:11+02:00
---

In 2021 my aging MacBook Pro (16GB RAM, I7) had issues with a swelling battery. The touch pad sensitivity became an issue. In order to replace that machine I opted for a MacBook Air (8GB, M1). Compilation speed (at least of F# code) on the Air is faster than the old machine, but it is not as responsive when I have a lot of things running at the same time.

In order to try out and showcase different technologies and services, I usually run Docker. Most images that I used where fine, however the one image that caused trouble was SQL Server as can be seen in the issue [Does not work on Mac M1 #734](https://github.com/microsoft/mssql-docker/issues/734).

For some cases I could use [Azure SQL Edge](https://learn.microsoft.com/en-us/azure/azure-sql-edge/disconnected-deployment). The troubles started when at work I started at a project using spatial types. I had the pleasure of getting a new developer machine (MacBook Pro M1) so I ran into the issue not only at home, but also at work.

To get around the issue I found that you can run container runtime in a different architecture (AMD) using [Colima](https://github.com/abiosoft/colima).

I tried out different configurations. What finally worked for me was to run:

```sh
colima start --arch amd --cpu 4 --memory 4
docker context use colima
```

This was inspired by a sample start configuration mentioned in the issue [v0.4.1: x86_64 getting stuck with qemu64 cpu #288](https://github.com/abiosoft/colima/issues/288), but slightly different. These settings worked on a M1 MacBook Pro where I fiddled with the CPU and memory until it started working.

Right now, many months later we see that Docker for Desktop has an experimental Rosetta emulation setting as seen in Recap of issue [Does not work on Mac M1 #734](https://github.com/microsoft/mssql-docker/issues/734#issuecomment-1382576843).

## Conclusion

I'm still running Colima at work, but I've tried the Rosetta emulation at home and it works well enough (after a reboot).
