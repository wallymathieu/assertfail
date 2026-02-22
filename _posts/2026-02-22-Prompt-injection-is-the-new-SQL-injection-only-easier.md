---
layout: post
title: Prompt injection is the new SQL injection only easier
date: 2026-02-22T17:36:43+00:00
tags: LLM
---

As I try out more and more of LLM assisted coding. The security issues feel like they are taken extremely lightly. The security issue I am referencing right now is that like when you use untrusted input an adversery can take advantage. This is not the only security issue. Sam Altman deflects from the issue by talking about people "Google" for help on building biologial weapens using their tools (i.e. that the training corpus contains sufficient information to allow for that). Other people have also expressed that it is a [deflection from real issues](https://www.youtube.com/watch?v=MaFTqjYjADw).

Using LLMs trains you in becoming desensitized towards getting huge chunks of text pushed in your face. Having software that you cannot vet, because the amount of code has exploded, means that potential issues can be hiding in the snow. In the long term we get to a [normalization of deviance](https://embracethered.com/blog/posts/2025/the-normalization-of-deviance-in-ai/) make fertile ground for attackers. Or expressed differently there is a [lethal trifecta for AI agents: private data, untrusted content, and external communication](https://simonwillison.net/2025/Jun/16/the-lethal-trifecta/).

Using LLM assisted coding has many challenges. The way people use the tools change as people discover ways that these tools can be made to work for them.

The interesting parts around security happens in how we use the tools. For instance there is docs around [sandboxing for Claude](https://code.claude.com/docs/en/sandboxing), [sandbox mode for Codex](https://developers.openai.com/codex/security/) and [security for GitHub Copilot](https://docs.github.com/en/copilot/concepts/agents/coding-agent/about-coding-agent#built-in-security-protections).

For power users there is less focus on security as seen on for instance [Kilo Code](https://web.archive.org/web/20260217153936/https://github.com/Kilo-Org/kilo/security) and [Roo Code](https://web.archive.org/web/20251213140715/https://github.com/RooCodeInc/Roo-Code/security).

When I was but a young boy around 10 years of age (ca 1990), we swapped diskettes. I remember having to reformat my computer due to getting viruses. When I was in my 20ies (2001) I stayed at a landlady's place in Lund, since I went to the university there. She had a computer that was noticeably full of malware. Later on when I moved to a student room, the local network had so many people with infected computers that if you plugged in a Windows computer that had just been installed, it would get infected before getting enough security patches from the net. I'm guessing that we are in a [rhyming situation](https://www.goodreads.com/quotes/5382-history-doesn-t-repeat-itself-but-it-does-rhyme).
