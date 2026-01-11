---
layout: post
title: Evaluating different programming languages for use with LLMs
date: 2026-01-11T18:52:08+00:00
tags: LLM
---

If we try to find some idea what language is better or worse for use with an LLM, we need to have some way of evaluating the different languages. I've done some small tests using different programming languages and gotten a rough estimate of how well LLMs work.

## Experiences 2025

What I've seen is that for a bit bigger program:

- Haskell takes time and converges slowly but requires less of my effort to fix.
- F# converges relatively quickly but requires a moderate amount of effort to fix. I.e. requires more effort to fix than Haskell.
- Rust can converge relatively quickly, requires moderate amount of effort to fix if you go functional, larger amount of effort to fix if you try to be more OOP.
- C# can converge relatively quickly but requires keywords to be more predictable (for instance "clean architecture" for a web api), requires a bit more effort to to fix than F#. I've felt that depending on what keywords you use, you get different results.
- Erlang can converge relatively quickly, though since I'm kind of rusty on Erlang I don't know if it works as intended.
- Python can converge relatively quickly. I have found that it requires more effort to fix than Haskell. I don't know better keywords to use in order to get better results. 

Note that these should be taken as small samples, so not representative of a larger set of tasks. 

Process that I usually follow:

1. Use a template in the target language for the git repository (this is to ensure that we avoid some security issues and get faster convergence)
2. Give the LLM a very detailed specifications of a feature and have it add tests and code.
3. Have the LLM run tests and iterate on test failures (with some manual intervention)
4. Check that api starts, curl the api.
5. Read through the entire program and fix any obvious mistakes

Some of the time I have seen that the LLM goes into a long doom loop where it does not converge towards any solution.

### Convergence

My own experience is that using functional architecture help LLMs converge towards correct solution more often. This might be because if you restrict side effects and use immutable data, it is easier to get working code. This aligns with my own experiences writing OOP style code in large code bases have benefited from using functional patterns to avoid hard to diagnose bugs. 

### Keywords

You might have noticed that I use keywords to influence the LLMs to output code related to a subset the training data. For C# I've mostly used "clean architecture". For F# I've gotten C# adjacent solutions unless I've specified keywords such as:

- Functional Core, Imperative Shell 
- Pipeline/Data Flow Architecture
- Event Sourcing and CQRS 
- Redux/Elm Architecture 

I've not done any closer comparison on how they compare to each other. I've seen that for C#, keywords are a must unless you work in an existing codebase with established patterns.

It would be interesting to see if we can find better keywords for different languages.

## SWE-bench Multilingual

For a more formal approach we have [SWE-bench Multilingual](https://www.swebench.com/multilingual.html). In this they evaluate different programming languages based on a small sample of open source repositories:

> It's possible that the difference in resolution rate is because the dataset happens to contain more difficult tasks in some languages.

Note also the limited sample size:

> 42 repositories representing 9 programming languages

The conclusion that Python is the best language, does not align with what I've seen (I've used a lot of commercial models). I think this means that we could get better benchmarks to evaluate how well LLMs perform on programming languages.

## Token efficiency

One interesting question is what programming languages can fit more functionality with less tokens: [Which programming languages are most token-efficient?](https://martinalderson.com/posts/which-programming-languages-are-most-token-efficient/)

If you go to the source for his post: [RosettaCodeData](https://github.com/acmeism/RosettaCodeData) you will find that a lot of the problems are not common to see in working software. The token per task graph does not align with my experience for say C# and Go where Go usually requires a lot of extra ceremony compared to C#. I had trouble with keeping Go within the token limit. This lack of semantic density could be due to lack of mature business oriented frameworks compared to Java/C#. 

I have seen that Haskell seem to have nice characteristics for LLMs (converges more often to correct solutions with less need for me to intervene). Perhaps not only the point about token efficiency, but also that Haskell has better type system compared to say Java and C# and can give LLMs a more clearly defined area that it needs to output, a "narrower surface".

## We await more benchmarks

I would like to hear other peoples experiences. My feeling is that depending on how you think about programming, influences the process you use to get working solutions from LLMs.