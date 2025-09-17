---
layout: post
title: Living with a machine ghost
date: 2025-09-17T06:00:59+00:00
---

LLMs or vibing is one technology in a long row of technologies and products that have promised to make programming more accessible. LLMs from what I've read, seem more to be the ghost of a portion of the internet canned into a GPU-ready package.

Usually the promise is that "Now, you wont need developers anymore, your regular skilled employees will do the programming". From what I've seen, looking at GUI programming it usually means you get a reduced programming environment without the tools programmers expect to use. If the problem or task is simple enough, the tool works well enough. When the complexity of the task gets out of hand, you will have programmers fix workflow or write "code". If you are lucky, this means that you either don't need programmers for the task or that you have bought yourself time until the programmers need to write a solution. The "hype" or "marketing" around the tool does not align with reality. Just because the salesman is lying doesn't mean what he is selling is useless.

The companies selling LLMs are either telling you or implying that you can use them for everything. 

- AI Will Replace You
- AI-driven automation will continue to eliminate traditional jobs but also create new opportunities and industries we can’t even imagine yet. / Jensen Huang

When it becomes obvious that this is not in line with reality they tell you:

- It will be better
- Artificial intelligence will reach human levels by around 2029. Follow that out further to, say, 2045, we will have multiplied the intelligence, the human biological machine intelligence of our civilization a billion-fold. / Ray Kurzweil
- The pace of progress in artificial intelligence is incredibly fast. / Jeff Bezos

Then comes the next hook:

- AI Won’t Replace You. A Human Using AI Will. / Reece Akhtar
- AI will not replace humans, but those who use AI will replace those who don’t. / Ginni Rometty

This means that unless you live under a rock, you will be fed FOMO and FUD.

You then seem to have an ecosystem of grifters and scammers that sell you snake oil or LLM services. This would not be a problem had the service been useless. LLMs give you texts that, since they have ingested of huge amounts of content from online sources, should be statistically similar to what a human would have produced. This means that there is a nonzero chance that you can get useful "novel" output that compiles into source code that does what you want it to do. We are in a situation with a mix of disinformation and information. A coworker recently summarized this as "do not trust, verify".

How do we navigate this space? My feeling is that in order to use AI generated source code, it is either sufficiently small that you can inspect it, or sufficiently locked down that you can trust it. LLMs are good at producing absolutely insane amounts of texts. This does not mean that they are more productive than a programmer that writes one line per day: you get a perverse incentive to inflate the numbers when lines of code is used as a productivity measure. My feeling is that you need to make sure that the LLMs are constrained by static type system and requirement size. You want the compiler help you verify the source code. 

The best is to use functional programming. You can have programmers reduce their degrees of freedom in source code in order to make the code as easy to audit as possible. Some of the lessons from functional programming can be applied to other languages, so you don't need to despair. Reduce the potential side effects and mutations. Use types and validations. You would need to figure out ways to constrain the LLM for languages like JavaScript and Clojure.

Code smells: when using Roo Code or Aider, the LLM generally tries to follow the patterns already in the source. Having complicated patterns or weirdness makes both you and the LLM confused.

DRY: Don't repeat yourself takes on a new meaning with LLMs, since many of them like to repeat themselves.

Architecture and patterns: from what I've seen, LLMs perform better on common patterns and common looking source (style of code that looks like what is on GitHub). I've seen LLMs do well enough for common architectures. For more obscure patterns or in-house frameworks, the LLMs seem to have a much harder time to produce working code. This is probably the old new thing, as many prefer using common solutions over niche solutions.

Another way to reduce the potential output of a program is to write tests. The LLMs cannot debug or test the end product in the same way as a human developer or tester, so having tests becomes more valuable in order to verify that the code does what it is supposed.

These practices, tools and techniques are not new, but gain a new relevance if you want a working solution without unintended side effects.

## Further reading

Some texts I've read recently:

- [Haskell LLM experiments](https://www.michaelpj.com/blog/2025/04/12/haskell-llm-experiments.html)
- [Julien Billes experience with cursor and clojure](https://medium.com/@_jba/my-experience-with-cursor-and-clojure-mcp-6e323b90a6f3)
- [AI friendly code design](https://www.thoughtworks.com/radar/techniques/ai-friendly-code-design)
- [Pushing AI autonomy](https://www.martinfowler.com/articles/pushing-ai-autonomy.html)
- [Where's the Shovelware? Why AI Coding Claims Don't Add Up](https://mikelovesrobots.substack.com/p/wheres-the-shovelware-why-ai-coding)
