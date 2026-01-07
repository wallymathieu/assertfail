---
layout: post
title: Devaluation of work
date: 2026-01-06T17:55:39+00:00
---

I have talked to multiple developers that have told me about getting LLM-generated pull requests. The pain is that we have a situation where you ignore the act of getting code to work and instead focusing on the optics of good enough looking code.

Instead of talking about how we ensure that the people that are tasked with doing the work, actually do the work, we talk about adding more LLMs as a solution to the problem of unproven LLM generated code.

## The point of source code

Another point is that programming is not about having code for the sake of code: Programming language text is to have a readable specifications of working software. Using languages like Python, TypeScript, JavaScript, Java or C# does not have any inherent value. The value of using common languages is that you have written text that can be modified and understood. Unreadable code is not a good thing. Machine generated code that no one wants to read, means you have [instant legacy software](https://codemanship.wordpress.com/2025/09/30/comprehension-debt-the-ticking-time-bomb-of-llm-generated-code/).

## Productivity

The amount of lines of code has never been a good [measure for productivity](https://blog.ploeh.dk/2025/09/22/its-striking-so-quickly-the-industry-forgets-that-lines-of-code-isnt-a-measure-of-productivity/). Remember "you get what you measure".

I've seen indications that [LLM coding tools make developers slower but they think they're faster](https://www.theregister.com/2025/07/11/ai_code_tools_slow_down/). Besides the indication that even when measurements suggest faster task completion, we get [maintenance mess](https://web.archive.org/web/20240624133953/https://visualstudiomagazine.com/articles/2024/01/25/copilot-research.aspx).

## Disruption

Most software developers that I have worked with have learned by doing (writing code). Having a shift towards mostly reading code, could mean a greater comprehension loss than we expect.

Rather than an acceleration of software development we see a disruption, that gets hinted in [Software Acceleration and Desynchronization](https://ferd.ca/software-acceleration-and-desynchronization.html). The ways we develop software changes (as it has done before). For instance code reviews in enterprise development was not a thing when I started working. It became more mainstream ca 5 years later (GitHub helped popularize review flow around 2010). We can expect the culture of software development to change in response to this new pressure.

## Conclusion

If we devalue aspects of software delivery pipeline designed to give you working software without a solution to compensate for the loss of quality, we (software professionals) will get the blame for the resulting issues.