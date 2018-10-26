---
layout: post
title: Is there a value in having diversity when it comes to solutions?
date: 2018-10-26T13:01:51+02:00
---

- Monoculture in agriculture has some definite downsides (lack of resilience, soil depletion, over reliance on fertilizer)
- Monoculture in buildings can cause people to feel lost. Once you move in, you want to change your house to fit your family and your interests.

A suburb that started out with lots of very similar houses can end up with divergent colors, additions suited for different people, gardens with personal style. This should not be seen as a negative thing, it shows the history of the area and give a sense of identity to the neighborhood.

In programming we often have a drive towards standardization.
 - perhaps in order to increase the industrial or engineering nature of it? 
 - To make it easy to get people from other teams to understand the code due to similarities in style


## Having different styles/architectures/programming language?

Since different software components suite different purposes, they should have style suited for different application / purpose.
When you use components from different companies and open source initiatives, they will not fit your style: they can help you deliver, so don't ignore things that don't fit your style (since they can help you deliver).

### One language to rule them all

There is talk about having a single language for frontend and backend. This type of talk has been going on for as long as I've been a developer. I've worked in such solutions: C#, Java or C++ as the single language. I've seen JavaScript on both client and server. This can be very helpful for people starting out. They use the same language that they are very familiar with in both settings. For one team this can be a good thing and help them deliver. 

However compiling Java or C# to JavaScript have had some interesting challenges. The debugging experience, error handling, diagnosing errors. Source maps and other tools have helped make this less of an issue. Though since most frontend web libraries are written in JavaScript, it is often better to be familiar with JavaScript.

Writing JavaScript on the backend has had some challences. The developers I've worked with have had it easier to work with C# (when it comes to deliver stable features). For simple services, JavaScript can be a good choice. There are also more mature libraries for Java and C# that fits more of server side development (for historical reasons).

Limiting yourself to one language also means limiting your recruitment base. Once people have started working, they usually pick up the other commonly used languages (in order to be able to modify other parts).

## Hiring different style of programmers

Developers will find their own style of coding as they mature. Different people will work in different ways. Some write text then code, some draw diagrams then code, some tests then code, et.c.. When you hire people, most probably they will not be familiar with your domain and your standards. Just because they are not familiar with your preferred style, they can still prove useful (to your organization).

### Consider frontend vs backend

When I started out, I didn't hear about this distinction, while today it's a big division. JavaScript was a loathed niche language. I think the primary reasons was that it was very difficulty to write working code. One big reason was due to browser differences between versions and vendors. Another reason was that linters was not in use. There are some gotchas that can be difficult to track down (unless you use linter). Then came jQuery (to smooth out the differences). Then came browser standardization.

Note however, if you write mobile apps or desktop applications, you can do that fully in C#.

### Hiring people

How do you hire ok frontend web people? You go with JavaScript (since that's the mainstream web frontend language right now). 

How do you hire ok backend people? You go with Java, PHP or C# (since they are the mainstream backend languages right now).

How do you find great developers? One way is to go a bit niche. Interested developers will want to learn new things. If you have 'cool' tech you can attract some of these guys.  

#### Niche language:

 - possible to hire great developers who have sought out the language in order to level up
 - harder to convince other people that they can work in such a language

#### very common language:

 - easier to recruit people directly from school (since it's common, schools target the language)
 - easier to recruit people from other parts of the industry
 - normal people, going to work and then going home, also called 9-5:ers or [dark matter developers](https://www.hanselman.com/blog/DarkMatterDevelopersTheUnseen99.aspx)
 
## Where should you have homogeneity?

You need people to make sure that components (libraries/services) have internally uniform style. Having a good structure will make it easier to read the code. What kind of structure? I would say that it depends on the project and people working on it.

