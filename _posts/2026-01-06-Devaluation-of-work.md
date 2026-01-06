---
layout: post
title: Devaluation of work
date: 2026-01-06T17:55:39+00:00
---

I have talked to multiple developers that have told me about getting LLM-generated pull requests. The pain is that we have a situation where you ignore the act of getting code to work and instead focusing on the optics of good enough looking code. Instead of talking about how we ensure that the people that are tasked with doing the work, actually do the work, we talk about adding more LLMs as a solution to the problem of LLM generated code.

## The point of source code

Another point is that programming is not about having code for the sake of code: Programming language text is about having readable specifications of working software. Using languages like Python, TypeScript, JavaScript, Java or C# does not have any inherent value. The value is having written text that there are people that can write and understand. Having unreadable code is not a good thing. Having code written by a machine that no one wants to read, means you have [instant legacy software](https://codemanship.wordpress.com/2025/09/30/comprehension-debt-the-ticking-time-bomb-of-llm-generated-code/). 

## Usability vs safe

The fundamental difficulties of software development have not been solved. We have seen that it has become easier to produce source code as a non technical person. If we can have solutions that help people build useful software that is safe to use and does not harm the users of the software (there are talk online about vibe coded projects that have harmed the end users).

A spreadsheet program is usually a very good tool for the intended purpose it has. It lets non technical people program in a reduced way without introducing the complexity of software development. This however is the opposite of what we see with LLMs.

Ideally we would only [deliver code that have been demonstrated to work](https://simonwillison.net/2025/Dec/18/code-proven-to-work/).

Building guard rails in terms of infrastructure, software frameworks and new programming languages could make LLM-generated source code safe. Some of the tools to build with LLMs in a safer way are already known. Having vetted templates, locked down languages and locked down frameworks can help. Who remembers [ADsafe](https://github.com/douglascrockford/ADsafe)?

## Productivity

I've seen indications that [LLM coding tools make developers slower but they think they're faster](https://www.theregister.com/2025/07/11/ai_code_tools_slow_down/). Besides the indication that even when measurements suggest faster task completion, we get [maintenance mess](https://web.archive.org/web/20240624133953/https://visualstudiomagazine.com/articles/2024/01/25/copilot-research.aspx)

The amount of lines of code has never been a good [measure for productivity](https://blog.ploeh.dk/2025/09/22/its-striking-so-quickly-the-industry-forgets-that-lines-of-code-isnt-a-measure-of-productivity/).

## Disruption

Instead of an acceleration of software development we see a disruption, gets hinted in [Software Acceleration and Desynchronization](https://ferd.ca/software-acceleration-and-desynchronization.html). The ways we develop software changes (as it has done before). For instance code reviews in enterprise development was not a thing when I started working. It became more mainstream ca 5 years later (GitHub helped popularize review flow around 2010). We can expect the culture of software development to change in response to this new pressure.

## Conclusion

It could be that even if we know that smoking is bad for you, once you get addicted, it is hard to stop the slop?