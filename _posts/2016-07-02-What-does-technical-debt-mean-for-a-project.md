---
layout: post
title: What does technical debt mean for a project?
date: 2016-07-02T08:20:29+02:00
tags: meta
---


Technical debt is a concept that suggests that the cost of developing software has been postponed. For instance it can be the conscious act of delivering features while taking shortcuts (in order to get them delivered at a certain date).

## Cost in time related to technical debt

When changing a component, the amount of bugs introduced is often related to technical debt of that components. Higher technical debt means greater likelihood of bugs.

The time to resolve various issues is related to the technical debt. Technical debt will express itself in the sense that some tasks that should be simple to complete take a lot of time to finish.

Estimation: There is a risk that after something looks implemented, there are Y number of bugs to be found. It may mean that after one task seems to be done, issues and bugs related to the component will crop up where each issue take on average X amount of time to resolve.

If nothing is done to pay off technical debt, you have a situation where after an issue A1 you have Y bugs. Each bug takes an average X amount of time to resolve. After each bugfix there is a risk of a new bug. Since the technical debt is not repaid, we see that the average time X will increase. It means that you have a similar situation as when a person with a loan allows the interest rate to accumulate (ie debt increases).

## How do you achieve profitability in a project with high technical debt?

Lower customer requirements in existing parts of the system. If you lack people that can hold off customer demands for changes in existing parts (requirements that entail greater complexity), customer requirements will drive increased costs.

Build separate modules where technical debt can be kept low. However, this can mean that the greatest cost (time spent) will be related to integration code (code to connect between things) between to connect modules of low technical debt with modules of high technical debt. However as long as you avoid changing modules with high technical debt, you can avoid cost increases.

Hire people that take a long term view (see the section about how to handle technical debt) in order to pay of the loan over time. Together with the developers, make sure that they create a long term plan for how to reduce the debt.

## What does technical debt mean for people working in the project?

The complexity and difficulties to deliver, can along with demands for quick deliveries create severe stress: Morality is reduced. This means that the probability of people leaving the project increases. The likelihood that people within the project burnout increases. What does this cost? [According to DN](http://www.dn.se/ekonomi/400-000-kronor-kostnaden-for-en-utbrand-medarbetare/), it can end up at about 400 000 SEK (ca 40 000 EUR).

## How do you handle technical debt?

- Doing code reviews with experienced developers
- Automatic testing to reduce the likelihood of regression
- Requirements management: ensure that the requirements reduce complexity (eg by having a dialogue to arrive at simpler solutions)
- By identifying the problem through different tools and working to isolate or remove the parts of the code that need to be changed due to customer requirements
- [Refactor](http://martinfowler.com/books/refactoring.html) parts that are covered by tests
- Create new modules that [strangle old parts of the system](http://www.martinfowler.com/bliki/StranglerApplication.html)

### How do you identify the problem?

Static code analysis can help identify problem areas. For example .net are:

- [NDepend](http://www.ndepend.com/)
- [sonarqube](http://www.sonarqube.org/) is able to analyse C# code (with some effort).
- [Resharper](https://www.jetbrains.com/resharper/features/command-line.html)
- Selected rules in StyleCop

Test coverage percentage can give you a picture of the areas where changes have higher probability of regression (ie can result in extra work).
