---
layout: post
title: Avoid Kubernetes districtions
date: 2019-04-15T07:47:14+02:00
tags: kubernetes
---

There are many cool things when it comes to Kubernetes. There are many shiny new technologies that promises the world.

However before buying into the hype, try to focus on the basics in order to deliver value to the business/customer. Kubernetes on its own is a platform for deliveries. Make sure that you don't go down the rabbit hole.

## First guides on getting started on Kubernetes

- Julia Evans [jvns.ca](https://jvns.ca/blog/2018/12/15/new-talk--high-reliability-infrastructure-migrations/) ignore most new cool things and focus on the basics.
- Alex Ellis has a nice guide on howto [move your project to kubernetes](https://blog.alexellis.io/move-your-project-to-kubernetes/).

## Getting traffic into Kubernetes

Ingress controllers that use annotations of your deployments are cool. Some of these tools are implemented using Envoy or Nginx. Instead of trying to figure out how the configuration of these tools are abstracted, it can be significantly easier to use a proxy as a [load balancer](https://kubernetes.io/docs/concepts/services-networking/service/#loadbalancer) directly.

You can get started on frontproxies like Ocelot or Envoy for traffic into your cluster by looking at the following:

- Sample [eShop On Containers](https://github.com/dotnet-architecture/eShopOnContainers) using Ocelot
- For a simple frontproxy scenario you can look at the configuration as seen in the [Envoy Helm chart](https://github.com/helm/charts/tree/master/stable/envoy).
- The envoy [docs are good](https://www.envoyproxy.io/docs/envoy/latest/), it is usually good to follow the proto type definitions.

Another good approach is to write a frontend service that wraps internal services. See for intance [Google Cloud Platform microservices-demo](https://github.com/GoogleCloudPlatform/microservices-demo) or [Hedvig Insurance API Gateway](https://github.com/HedvigInsurance/api-gateway).