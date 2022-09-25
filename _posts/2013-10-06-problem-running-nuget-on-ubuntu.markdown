---
layout: post
title:  "Problem running NuGet on Ubuntu"
date: 2013-10-06T23:19:00+02:00
tags: C# nuget
---

I had some trouble running NuGet on ubuntu. I'm running an Ubuntu server. Turns out that you need to install certificates:

```bash
mozroots –import –sync
```

Otherwise NuGet will fail to decode the results when fetching packages over https.
