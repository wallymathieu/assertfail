---
layout: post
title: Patch net7 dev container for net8
date: 2023-11-14T22:17:07+02:00
tags: dotnet docker
---

Since there isn't an official dev container for net8 yet, you can use the net7 dev container and the setup scripts mention on [Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/core/install/linux-scripted-manual#scripted-install).

Instead of the base image:

```dockerfile
FROM mcr.microsoft.com/devcontainers/dotnet:0-7.0
```

You can add the following to ensure that net8 is installed:

```dockerfile
RUN wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh
RUN chmod +x ./dotnet-install.sh
RUN sudo ./dotnet-install.sh --channel 8.0 --install-dir /usr/share/dotnet
```
