---
layout: post
title: Avoid Kubernetes districtions
date: 2019-04-15T07:47:14+02:00
tags: kubernetes
---

After working on Kubernetes for a few months, I've found that the advice from Julia Evans [jvns.ca](https://jvns.ca/blog/2018/12/15/new-talk--high-reliability-infrastructure-migrations/) is worth considering: If you care about making deliveries in timely manner then ignore most new cool things and focus on the basics. Alex Ellis has a nice guide [move your project to kubernetes](https://blog.alexellis.io/move-your-project-to-kubernetes/). I've found the templating used by Helm to be OK enough.

I would guess that a simple starting point would be to use a frontproxy like Ocelot or Envoy for traffic into your cluster.

- Sample [eShop On Containers](https://github.com/dotnet-architecture/eShopOnContainers) using Ocelot
- Envoy is neat. For a simple frontproxy scenario you can look at the configuration as seen in the [Envoy Helm chart](https://github.com/helm/charts/tree/master/stable/envoy). It also makes sense to read the Envoy docs.

Another good approach is to write a frontend service that delegates reads and writes to internal services. See for intance [Google Cloud Platform microservices-demo](https://github.com/GoogleCloudPlatform/microservices-demo) or [Hedvig Insurance API Gateway](https://github.com/HedvigInsurance/api-gateway).