---
layout: post
title: Yak shaving using slot machine
date: 2026-06-27T15:58:28+02:00
tags: LLM
---

I try to use the slot machines to solve code-related issues. For some tasks, these machines work well, for some tasks we get a long line of "wiggle until it works" but the wiggling does not produce anything close to working. If you let the model provider auto-select a model, you can get the flip-flopping of what looks like someone spinning around in circles. It is annoying to work with. Switch the model, throw some new things at it and put a few more coins in the slot.

If you wonder why I say yak shaving, it is because we get similar kind of pattern as seen in old stories such as [The Old Woman and Her Pig](https://web.archive.org/web/20260627143720/https://sites.pitt.edu/~dash/type2030.html). In order to get to the end you have to pass through a lot of hoops and loops.

One could see a point in that you can get useful work done through stupid models using stupid processes:

>  If it works despite being inelegant, call it "heuristic" like the rest of us do.

Or using [Steve McConnell's words](https://www.goodreads.com/quotes/426084-heuristic-is-an-algorithm-in-a-clown-suit-it-s-less):

> Heuristic is an algorithm in a clown suit. It’s less predictable, it’s more fun, and it comes without a 30-day, money-back guarantee.

### Clown car collision

We have (mostly a coworker more competent at prompting Lovable) done a nice looking GUI from swagger and screen shots. Prior to this I had done a minimal working solution that has [MSAL integration](https://learn.microsoft.com/en-us/entra/identity-platform/msal-overview) and the APIs working from Claude and the same swagger docs. Then using the clown car solution of asking Claude to merge them. Collision gave a new car. Verdict, looks really nice. Works with some rough corner cases. 

Can we ship it? The boss worries that this is a drive-by addition with extra maintenance burden for a project with a small budget. The discussion around one-off GUIs and the cost of code is not over yet.

### Locking in and grind it down

In order to box in the more capable LLMs, add tests. Add a lot of tests to capture functionality, then once you are convinced Yak can be shaved without too much blood, let them rip. Using this we have managed to improve performance. Yes, it is mid, but we are babysitting neural networks for profit.

What do I mean by tests? This means that a mixture of unit tests, property-based tests, testcontainer-backed integration tests and for added spice, mutation testing to test the tests. Not perfect by a long shot, but useful.

### Going back to the future

Another year and I still feel like the best advice to people getting into this is to use patterns we know work well: human-friendly code. Modules, simple code, Goldilocks amount of documentation, etc.
