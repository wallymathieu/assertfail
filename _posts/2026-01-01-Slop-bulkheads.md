---
layout: post
title: Slop bulkheads
date: 2026-01-01T21:47:34+00:00
tags: LLM
---

How can we ensure that we use the LLM to generate useful code/features and fix bugs?

I don't think we can put the same expectations on LLMs as on junior coworkers. You hire junior developers in order to have people that are expected to grow and learn. LLMs come pre-trained (i.e. there is no point in teaching them as they are fixed neural nets after training). But anyway let us take the idea of having a multitude of "agents" to the logical conclusion.

Say that we have a bunch of teams working on producing a complete system. One reason to use microservices is to split teams into areas where they can iterate without the communication overhead of being fully integrated in the same code. We can argue that the same idea can be applied to isolate agent-contexts so that we treat LLMs as a team or a multitude of teams.
 
We know that it is easier to generate new code than to have old code suitable for LLM. Why not embrace this pattern? Create many small services. Can we minimize some of the risks associated with LLM generated code by giving smaller scope and permissions to the code bases that the LLMs are generating?

When we generate new code with LLMs we do know that LLMs are vulnerable to slop squatting attacks. This is besides all of the other security related issues related to LLMs. My guess is that if you start with a small known template, then iterate on that, you avoid some of the risks. When creating CRUD-approximate applications the amount of libraries that you need are known, why you can start with a good enough template.

What kind of infrastructure allows us to have fine grained control over the access that networked attached service have? Does this mean that there is a need to go deeper into K8S and similar in order to become more AI friendly?
