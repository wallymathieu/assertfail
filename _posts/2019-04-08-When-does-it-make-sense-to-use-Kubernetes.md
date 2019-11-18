---
layout: post
title: When does it make sense to use Kubernetes?
date: 2019-04-08T21:14:03+02:00
tags: kubernetes
---

## The bad

There is a certain level of complexity associated with Kubernetes. Depending on how you get started, it can be a bit of a chore to get a cluster up and running. There are costs associated with having a stable cluster up and running.

## The good

What does Kubernetes give you? It offers an environment for hosting docker services that is more portable between vendors. It allows you to run an environment locally mimicking your production environment. You are able to gradually roll out new versions of services and scale them according to need.

## My Guess

I would guesstimate that if you have a few services (say 5-10) without a network topology and your scaling needs fits a single computer, then kubernetes is probably overkill. While if you want or plan to host a multitude of different services then the complexity looks justified.

- You have a lot of service/site/job deliverables that work well as docker images
- You want the infrastructure to help maintain uptime and roll out deployments
- You estimate that Kubernetes will be prevalent in the future and want in on it now

## Similar Alternatives

Note however that there are some other alternatives you might want to look into. See for instance [Docker Swarm](https://docs.docker.com/engine/swarm/) or [Service Fabric](https://azure.microsoft.com/en-us/services/service-fabric/) and [OpenShift](https://www.openshift.com/).
