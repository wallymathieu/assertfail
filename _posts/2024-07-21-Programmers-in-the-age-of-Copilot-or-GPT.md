---
layout: post
title: Programmers in the age of Copilot or GPT
date: 2024-07-21T21:17:16+02:00
tags: 
comments:
  - author: Oskar Gewalli
    content: "
        > two out of three developers aren’t seeing significant productivity gains from using AI tools.\n
        \n
        From [New Atlassian research on developer experience highlights a major disconnect between developers and leaders](https://www.atlassian.com/blog/developer/developer-experience-report-2024).\n
        Suggesting that we are still in the early days of these tools.
        "
    date: 2022-07-21T21:30:35+02:00
---

## Introduction

We have seen a rise in the use of non deterministic tools based on machine learning in recent years. Tools such as [GitHub Copilot](https://github.com/features/copilot) and [ChatGPT](https://platform.openai.com/docs/overview) have brought a change to how some programmers write code.

We have the following article: [New GitHub Copilot Research Finds 'Downward Pressure on Code Quality'
](https://web.archive.org/web/20240624133953/https://visualstudiomagazine.com/articles/2024/01/25/copilot-research.aspx). You can find other papers around the impact of relying too much on such tools by searching for research papers.

My guess is that even though we have changes around tooling, that the impact will not be as large as the hype suggests.

### Terms

I use the term programmer here broadly to mean anyone that writes code, implying also: software developer, software engineer, software architect et.c.. These terms mean different things depending on context.

## Tools that have had big impact on programming in recent history

### Unit tests

Unit tests ensure code performs as expected, catching errors early and facilitating refactoring. Despite their importance, many  overlook their usefulness.

You need to think about how you write your tests and the impact they have as can be [heard from DHH in test induced design damage](https://dhh.dk/2014/test-induced-design-damage.html).

### The internet

The introduction of the internet drastically changed the accessibility of information for the average person.

Before the internet, learning resources were limited to books or physical digital media.

### Code completion

Code completion is considered the norm today. I remember people telling me that it rots your brain. If code completion really rots the brain or not has become moot at this point for many mainstream programmers as the context around how we develop has shifted into making them indispensible.

### Stack Overflow

With the introduction of [Stack Overflow](https://stackoverflow.com/), we noticed that some programmers would copy paste "solutions" into their own code without reflection. We see this in the joke around [the stacksort algorithm](https://gkoberger.github.io/stacksort/). 

We know that people copy paste from Stack Overflow into their own source code, as can be seen in [this article](https://www.sciencedirect.com/science/article/abs/pii/S0950584917303610). I've seen an example of using Stack Overflow answer that contained desktop style code into a .net framework web application. The code worked when the programmer tested it locally, but failed when more than one person accessed the application. This illustrates the importance of understanding the context and functionality of code snippets before using them.

What I've seen over the years is that Stack Overflow has been a great resource for people to find answers to problems. We tend to forget that [SEO](https://en.wikipedia.org/wiki/Search_engine_optimization) made it difficult to find relevant information on the net even before the flood of machine generated content. You could argue that Stack Overflow fixed that since it promoted contributors.

### GitHub

[GitHub](https://en.wikipedia.org/wiki/GitHub) has been a big boost to working with software. The main benefit has been that it has been a place where you can read source code and create issues on projects. Untrusted contributors have been given the opportunity to send [pull requests](https://en.wikipedia.org/wiki/Fork_and_pull_model).

Another side of GitHub is that it is a source of code examples that you can use as a base when you start your projects. The same dangers of downloading and using code from the net applies to source from GitHub as well.

### Copilot

The way I use Copilot is often as a base and then modify the result to make it work. Sometimes when I'm lucky (or the problem is simple enough), Copilot will serve up the right answer right away.

I've seen Copilot deliver good enough simple regex, simple unit tests, simple React class components converted into function components, copy pasted code lines turned into function calls. I've seen that Copilot does well enough in some cases and fails in other cases.

Regardless of the tool, you always need to verify the generated code. Writing tests or having a short [REPL](https://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop) feedback loop can help to confirm that it does what you intended it to do.

#### Alternatives

As an alternative to Copilot you can use [ChatGPT](https://platform.openai.com/docs/guides/chat-completions) as well as [Ollama](https://ollama.com/). You might also want to look into [Agentic AI](https://github.com/microsoft/autogen). It is yet too early to see how they will be used in the context of software programming. 

## Where do we end up from here

You have the same issues with Copilot as when searching for code online and reusing it. You need to verify that the code actually does what you think it does.

We have seen changes to how people program before. Junior programmers have done silly mistakes because they have tried to run before they could walk. One of the benefits of applying machine learning to programming compared to other areas is that you can get a feedback loop going by compiling and running tests.
