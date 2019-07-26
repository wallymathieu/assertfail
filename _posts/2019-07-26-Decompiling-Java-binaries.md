---
layout: post
title: Decompiling Java binaries
date: 2019-07-26T21:02:44+02:00
tags: java
---

There are some tools out there to decompile Java binaries. I've found that the easiest one to process an entire jar is [Fernflow](https://github.com/JetBrains/intellij-community/tree/master/plugins/java-decompiler/engine).

In order to build you notice that it's built using [Gradle](https://gradle.org/). Either install gradle or use existing shell wrappers to build the jar file.

Once you have built the decompiler you might want to wrap it up with a shell wrapper and put the executable in your path next to the fernflower.jar:

```bash
#!/usr/bin/env bash

java -jar `dirname "${0}"`/fernflower.jar $@
```
