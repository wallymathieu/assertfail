---
layout: post
title: Why do we need microservices
date: 2019-08-20T10:08:49+02:00
tags: microservices architecture
---

## Polyglot

I've found that I'm way more productive in some languages compared to others. This is common enough occurrence according to ThoughtWorks that they mention polyglot programming under their tech radar in [techniques](https://www.thoughtworks.com/radar/techniques). It also allows the use of heterogenous teams that can bring different strengths to the table. Sometimes a language/virtual machine has a library or framework especially suited for your problem/task.

## Code chunks

> Shitty code behind nice interfaces

If we look at the group intercommunication formula: `n(n − 1) / 2`, it should be fairly obvious that having tight coupling between teams without clear interfaces causes increased communication need. By defining nice API with nice enough documentation to communicate between team responsibilities you can ensure that teams can focus. I mean focus in the sense that team members are not led astray by leaky abstractions by exposing internal implementation details causing confusion for the uninitiated. As seen in the previous post, we do not strictly need to use microservices in order to satisfy this goal.

One of the unintuitive facts of programming is that by restricting the possibilities can lead to improvements. This fact can be seen when it comes to static type systems. The same can be applied to API evolution. By making it harder to evolve an APIs, we can make it easier to be backwards compatible. Having a more focused API for a subdomain also makes it easier to reason about cache-logic and scaling. By keeping API's backwards compatible you can evolve separate parts of your system at their own pace.

## Cost and planning

> Measuring software productivity by lines of code is like measuring progress on an airplane by how much it weighs

Software estimation techniques show that the time and cost of software is closely related to the line count of the system where changes are made (see [Software Estimation](https://www.goodreads.com/book/show/93891.Software_Estimation)). This implies that having subsystems that can be reasoned about in isolation means that it's easier to estimate and plan changes (as well as keep cost reasonable).

The cost of microservices has in fact decreased over the years. Note for instance that deploying a hosted Kubernetes solution with a light workload can cost you as little as around 30$ per months depending on your vendor. Deploying multiple sites into a single App Service on Azure can be quite cheap as well.

## Conclusion

Microservices allows you to build small isolated services in different languages accessible by HTTP requests. The operational cost gives you flexibility. The difficulty and cost of hosting microservices has become more democratized, why it has become more feasible for many workloads.
