---
layout: post
title: Using functional programming to optimize frontend code
date: 2021-06-06T11:59:41+02:00
tags: JavaScript react TypeScript
---

## Intro

During 2019 I started on the current project. At this project I'm working on, we are building a enterprise system for a government customer. When I got in significant parts had been developed of the frontend and backend system. My role when I started in the project was in order to help develop test automation software for the system. Since I've worked on both frontend and backend parts in other systems, I'm able to help out in various parts of the system.

I'm going to talk about one particular issue in the frontend code. When I got into the project, the frontend used mainly [Formik](https://formik.org) for forms. There is significant complexity in the frontend code. Some of the forms are quite complicated and have a lot of behaviour. While debugging we noticed that the frontend started to slow down significantly for the bigger forms. Since the end users was not affected, we hoped that it would be fine. As new requirements got implemented the slowdown during development started to manifest during end user testing.

## Solutions

The question was what to do? The first obvious options are the following:

- Change the design and the requirements and rewrite the existing implementation
- Find a more performant library that does roughly the same thing and rewrite the existing implementation
- Optimize Formik

These options are not very palatable. Changing the design and requirements would require stakeholders to agree on new requirements and a new design. Since there has been a lot of politics involved in getting the current design and requirements approved, changes would require significant amount of time.

We started evaluating different libraries. Problem with that approach is that it requires a lot of changes in the frontend code in order to evaluate if the other library would improve the performance. This could potentially end up eating a significant amount of trial and error (potentially costing weeks of effort).

While looking at the Formik code base in order to optimize it, we noticed that there is a lot of historical luggage that shows up in the code making optmizations quite difficult.

## Lazy reimplementation

Since there is a lot of luggage in Formik, but we only use selected parts, we realized that given around 20 hours work we could implement a library having the API surface that we use but with better performance. Since we could evaluate different implementation options for the existing code we could do some trial and error (using the existing frontend) without having to do extensive rewrites.

During the implementation I talked to [David Wincent](https://github.com/davidwincent) (another developer in the team) about React performance and different approaches. We evaluated the following:

- [Hookstate](https://github.com/avkonst/hookstate)
- [React Hooks](https://reactjs.org/docs/hooks-reference.html)
- [React Redux](https://redux.js.org)

Due to the API surface that we used, it did not look as if it was suitable to use hookstate for the implementation (I had some issues getting the API to work using Hookstate). We like Redux, but we wanted to isolate state to avoid changes causing rerenders in unrelated parts of the application ().

There is a lot of code that gets executed during render instead of in the reducer in Formik. There was some insights into getting more performant code:

- There are posts such as [Kent C. Dodds blog on howto use react context effectively](https://kentcdodds.com/blog/how-to-use-react-context-effectively) talking about how having dispatch and state in the same React context can post impact performance.
- Code executing during render impacts the user experience more than if it's executed in the reducer
- It is significantly easier to implement an existing API surface compared to writing from scratch
- Existing unit tests can help speed up development by guiding development effort and lowering chances of regressions
- The fastest thing to do, is to do nothing

## Functional rewrite

Since React is heavily inspired by functional programming, we could apply

- We could apply [defunctionalization](https://blog.sigplan.org/2019/12/30/defunctionalization-everybody-does-it-nobody-talks-about-it/): instead of executing code in the Field array we send messages to be executed in the reducer.
- Immutable data and lenses: Instead of guarding against developers not following React best practises we could assume in the implementation that the data is immutable and reuse an existing lens implementation in order to get a faster copy updates.

## Conclusion

We could get [a library](https://github.com/Decerno/formik-reimagined) that performed significantly better than Formik for our purposes. The time it took was around 25 hours to get to a point where the performance did not impact the end users anymore. Functional programming patterns are useful for more than the sake of correctness.
