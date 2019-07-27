---
layout: post
title: Maven security issues scanning
date: 2019-07-27T07:20:08+02:00
tags: java
---

There is a mature package management system in the Java world. Maven seems to be quite standard. I've made [a sample project](https://github.com/wallymathieu/hibernate-studies) with Hibernate and Spring. One of the neat things I found out was that it's quite easy to integrate [OWASP](https://owasp.org/) checks. Following the [guide](https://jeremylong.github.io/DependencyCheck/dependency-check-maven/index.html) to setup a simple way to be able to that your closed source system does not have any known vulnerabilities in dependencies.
