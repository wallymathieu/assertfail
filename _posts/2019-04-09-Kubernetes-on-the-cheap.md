---
layout: post
title: Kubernetes on the cheap
date: 2019-04-09T07:32:29+02:00
tags: kubernetes
---

You can use the fact that Kubernetes allows you to get a stable environment on unstable hardware, so that you can use a bunch of cheap commodity computers to scale your deployments horizontally. A good starting point would be to build your own test cluster.

- Jeff Atwood talks about using colocation in [the cloud is just someone elses computer](https://blog.codinghorror.com/the-cloud-is-just-someone-elses-computer/)
- Hanselman tells you [How to Build a Kubernetes Cluster with ARM Raspberry Pi then run .NET Core on OpenFaas](https://www.hanselman.com/blog/HowToBuildAKubernetesClusterWithARMRaspberryPiThenRunNETCoreOnOpenFaas.aspx)

Another approach is to look into where hosted Kubernetes is more affordable than say [EKS](https://aws.amazon.com/eks/pricing/).

- [kubeadm-aws](https://github.com/cablespaghetti/kubeadm-aws)
- an example where someone used GKE to get [hosted Kubernetes for personal projects](https://news.ycombinator.com/item?id=18111665)
