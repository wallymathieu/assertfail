---
layout: post
title: Estimated language popularity in Sweden among companies
date: 2020-02-02T17:28:01+01:00
---

### Raw numbers

I've written a simple project in f# to read puplic information from the job agency in Sweden:

| Number of listings | Language |
| --------------|----------|
| 6964 | java |
| 6085 | javascript |
| 5727 | c# |
| 3929 | python |
| 3359 | c++ |
| 2600 | c |
| 1360 | php |
| 1230 | golang |
| 1151 | typescript |
| 589 | matlab |
| 442 | bash |
| 420 | kotlin |
| 381 | r |
| 344 | scala |
| 332 | perl |
| 318 | ruby |
| 220 | ada |
| 157 | erlang |
| 118 | groovy |
| 78 | rust |
| 71 | cobol |
| 63 | tcl |
| 61 | f# |
| 49 | ecmascript |
| 48 | scheme |
| 47 | elixir |
| 44 | haskell |
| 39 | clojure |

the numbers should be read as there has been 6960 unique listings for Java. This does not tell you if its a republished job advertisement. Most companies do not publish source code, why keyword search on job ads offer a way to give an estimate of demand.

### Method

I've filtered out some languages since my guess is that without further analysis they are overrepresented due to the fact that they share their name with common words. Such a language is for instance "swift" and "go". In order to give an estimation of the popularity of golang, I've done a crude match of the context that the word Go shows up in. My guess have been that some constructs such as:

- "språket Go"
- "Go lang"
- "Go and "
- " in Go "
- ", Go,"
- ", Go."
- " on Go "
- " i Go "
- ", Go or"
- " som Go,"
- "• Go"

indicate a mention of the language Go. We can estimate how popular Go is.

I've done some adjustments for C# since there are a some aliases such as "csharp" or "c #".

You can find the source code for the analysis on [github](https://github.com/wallymathieu/arbetsformedlingen).

Most of the analysis is keyword matching in text corpus.

### High level analysis

Most of the top langagues are not surprising. The language that surprised me was Python, since it is considered niche in the subset of companies that I've worked in.

In the mainstream category of languages we see that Java, JavaScript and C# dominate. This should not be surprising since these are used to write business applications and web applications.

Python is roughly 1/2 as popular as Java or around 2/3 of C#. Python is used for such things as web programming, data analysis and machine learning.

C++ is roughly 1/2 as popular as Java as well. I've heard from people working in the financial industry using C++. I've also heard that some games are written in C++ (besides such examples as [Doom 3](https://github.com/id-Software/DOOM-3-BFG)). C and C++ are used for embedded application development.

One of the interesting things found in this list is that PHP seems to be still somewhat prevalent on the market but waning if you compare to for instance Python.

Typescript is used more widely than I would have assumed. At work we use Typescript in order to make Javascript programming easier when dealing with larger code bases. I've seen some confusion around what is runtime types and compile time types when it comes to Typescript programmers. Though Javascript seems to confuse programmers in many different ways. My personal opinion is that you should combine Javascript with heavy use of linters.

Golang seems to have risen sharply in the Swedish marketplace. Talking with a programmer focused on embedded development, I've heard that it's a nice language for junior embedded developers. Since Golang is very similar to other C style languages it's probably not hard introduce developers to the language.

### Mainstream languages

If we look at the broad categories of mainstream languages we have a main category that seems popular: C style languages:

  - C
  - C++
  - [Java](https://en.wikipedia.org/wiki/Java_(programming_language)#History)
  - [JavaScript](https://en.wikipedia.org/wiki/JavaScript#Beginnings_at_Netscape)
  - [C#](https://en.wikipedia.org/wiki/C_Sharp_(programming_language)#History)

The reason for this seems to be more align with C being popular, then C style syntax being adopted due to that fact.

Python is the odd duck in this context as it's not C style. There is some research that suggests that [it is better for novices](https://quorumlanguage.com/evidence.html) than C style syntax.

### Niche languages

Some interesting groups of languages are:

- [Lisps](https://en.wikipedia.org/wiki/Lisp_(programming_language)) such as Scheme and Clojure
- [ML style languages](https://en.wikipedia.org/wiki/ML_(programming_language)) such as Haskell, F# and OCaml
- [Logic programming](https://en.wikipedia.org/wiki/Logic_programming) such as Prolog and MiniKanren.

Perhaps we will see some languages such as Rust and ReasonML, where you have some ML style typesystem features togheter with C style syntax, gain popularity? Java was heavily marketed and has huge market adoption. C# has a strong corporate sponsor. My guess is that neither of these languages will be usurped in the medium term (5-10 years). Mozilla and Facebook have not marketed Rust or ReasonML heavily in order to further widespread adoption.

### Conclusion

New programmers looking for entry level jobs will probably find ample opportunities in mainstream langauges such as Java/C#, Javascript and Python. Knowing C style languages seems to be a sure bet short term and long term.
