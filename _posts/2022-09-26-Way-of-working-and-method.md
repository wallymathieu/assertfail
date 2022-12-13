---
layout: post
title: Way of working and method
date: 2022-09-26T18:24:22+02:00
---

## How do we develop software

How do we arrive at working software? Some of the ways I've seen are:

- Use of known working patterns, techniques, language features, libraries: Restrict what everyone does to only the patterns that are known to work. The assumption is also that by using a small subset of tools it is going to be easier for juniors and generally [99% of all programmers](https://www.hanselman.com/blog/dark-matter-developers-the-unseen-99) to join.
- Use logical reasoning based on known properties of written code and the implied effect of changes.
- Manual testing of business logic by a user or a tester or developer trying to act as a user in order to verify that the solution work.
- Manual testing with a debugger in order to verify that smaller parts works as intended.
- Automatic tests: program executes small parts of the program in a somewhat controlled manner to verify that it works as intended (and that no regressions have occured).
- Divide and conquer: Split a system into smaller parts in order to make it easier to make the individual parts.

Not every software shop agrees on how to test software. GUI software is usually dealt with in a different manner compared to server software.

### Restrictions

Developers can be helped in their reasoning by restricting what the code and developers are allowed to do.

#### Social mechanisms

Common social methods (that I know of) used to restrict a solution are:

- Avoiding mutable state : As seen on [Microsoft](https://learn.microsoft.com/en-us/dotnet/csharp/write-safe-efficient-code) and [Oracle](https://blogs.oracle.com/javamagazine/post/java-immutable-objects-strings-date-time-records)
- Avoiding hidden side effects (such as through global static variables).
- Consensus around architecture of a solution
- Freezing code: avoid any change of parts of the written code. You can employ the pattern for longer than is suggested on the article about [Freeze on Wikipedia](https://en.wikipedia.org/wiki/Freeze_(software_engineering)).
- Need approval before applying changes. See [Pull requests section on Distributed Version Control](https://en.wikipedia.org/wiki/Distributed_version_control).

These methods are not applied in every codebase.

#### Mechanical restrictions

Common tools to restrict what the code is allowed to do and how it is written are:

- Statically-typed languages such as C#, Java as opposed to for instance JavaScript. There are [many such languages](https://en.wikipedia.org/wiki/Category:Statically_typed_programming_languages).
- Static code analysis tools. It is common to use linters for JavaScript and TypeScript, but [there are others](https://en.wikipedia.org/wiki/List_of_tools_for_static_code_analysis).
- Executable tests. For instance [Unit Testing](https://en.wikipedia.org/wiki/Unit_testing).
- Architectural analysis tools. We have seen the use of specifications as tests in [ArchUnit](https://www.archunit.org).

I do mean that not all of these restrictions are applied in every development shop.

### Scientific method

How does this compare to the [scientific method](https://en.wikipedia.org/wiki/Scientific_method)?

- Automatic/manual testing is a way to verify behavior of some code given some known state.
- A known working pattern in programming could perhaps be seen as a hypothesis that has been proven to work for some use cases.
- The use of logical reasoning seems very much connected to the scientific method.

### Existing code

In many cases it takes many years and you have multiple people and involved. The task of keeping software working as intended then also involves knowledge sharing.

- New people (to the software development team) run the software with a debugger and trace logging in order to get an understanding for how the system works or is intented to work. Debugging takes a lot of time, so you would limit yourself to only what you think you need.
- New people read the written code in order to get an understanding for how the system works. This is a very difficult thing since the amount of code written is usually large enough that people need to develop speed reading skills and be able to summarise huge chunks of text. Different styles and different lingo can make the task even more difficult.
- Use of written documentation in order to document intented behaviour. This is notoriously hard since writing documentation requires writing skills in another language than the programming language. Even if you write documentation in your native language, you might not be a good writer. I could imagine that a good poet or song writer does not automatically become a good novelist. The pressure on delivering can make you ignore some parts (such as the documentation).
- Use of testing in many ways in order to verify that the system still works after new features have been added. This is sort of like when you add plumbing into an already built house. If you are not careful you might ruin the house while adding the feature.

What I'm trying to say is that there are many ways that people have been going on writing software.
It is not difficult to arrive at working software that no one can read. I've seen it happen due to too much text or written in a language/pattern people are unfamiliar with. Common reasons why that might happen can be:

- The person is a junior developer.
- The code is old. It's written in a language or in a style no longer in common use.
- Written in a style from a movement that the person is unfamiliar with.
- Written in a haphazard way.
- Wall of text (wall of code). The amount of code/text makes it difficult to grasp.

#### Literary methods

This gets us into the question how do you write.

- Known language
- Known patterns that help people understand what the program is intended to do.
  - map/filter/reduce or select/where/join
  - factory/observable/command et.c.
- Structuring the code in order to be able to be able to find different parts.
- Strategy around important and less important text.
- Splitting up the code into smaller chunks that are meaningful on their own.

This is mostly my interpretation of written code. I usually try to understand the code and the context it was written in. Many words and patterns make sense if you know the background of the programmers involved.

## Conclusion

The point I'm trying to give you is that there are many ways of writing working software. The common parts are related to social methods, formal methods and literary methods.
