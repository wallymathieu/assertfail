---
layout: post
title: ESB and service mesh
date: 2019-07-28T20:58:14+02:00
tags: microservices architecture
---

## Service mesh

Service mesh looks like an evolution of [Enterprise Service Bus](https://en.wikipedia.org/wiki/Enterprise_service_bus) and has similar focus. An ESB is a single point of failure. Since it's a combination of many concerns, it can be hard to get right. A service mesh tries to mitigate this by focus mainly on HTTP, HTTP2 style communication and being distributed as a deployment (each service has it's own copy of the mesh software).

### Typical concerns

- Security (restrict traffic between services, use ssl for internal communication)
- Observability (being able to trace requests and communication between services)
- Traffic shaping (route traffic to avoid faulty services)

### When does it make sense

A service mesh starts to look really attractive once you start get into something like hundreds of services written by several teams. For fewer services it might introduce unnecessary operations overhead. This should be similar to recommendations around ESB. This should also be depending on if your service provider makes it easy to enable such a service. Using a service mesh also looks more attractive than using ESB since some of the issues are mitigated.

### When doesn't it make sense

If you have mostly things hosted on one type of web server/service host, then collection of web server logging might be enough to satisfy the observability requirement. For instance when your hosting provider makes it easy to enable HTTP log collection. Going towards more dockerized services shifts your needs (as you do not have as homogeneous environment).

The security requirement could also be satisfied by decent middleware. Many HTTP frameworks have JWT support. Your hosting provider could let you enable [let's encrypt](https://letsencrypt.org/) for sites.
