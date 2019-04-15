---
layout: post
title: Kubernetes and districtions
date: 2019-04-15T07:47:14+02:00
tags: kubernetes
---

There are many cool projects you can install into Kubernetes. However before buying into the hype, try to focus on the basics in order to deliver value to the business/customer.

## Start with few components

You can start by following Alex Ellis guide on howto [move your project to kubernetes](https://blog.alexellis.io/move-your-project-to-kubernetes/).

One thing to take away from [Julia Evans talk: High Reliability Infrastructure Migrations](https://jvns.ca/blog/2018/12/15/new-talk--high-reliability-infrastructure-migrations/) is:

> ignore most kubernetes ecosystem software

## Don't start with ingress controllers

Ingress controllers are cool. They promise to simplify the setup of ingoing traffic into your cluster. The technology behind most of this tech are the proxies Envoy and Nginx. Ingress controllers offer an abstraction on top of reverse proxies. It can be significantly easier to use the reverse proxies directly without the abstractions.
