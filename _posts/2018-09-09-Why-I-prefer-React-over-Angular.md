---
layout: post
title: Why I prefer React over Angular
date: 2018-09-09T10:18:42+02:00
tags: JavaScript angularjs react knockout
---

 - React has a smaller scope than Angular.
 - I've found that my coworkers have an easier time grokking React than Angular: React contains fewer concepts than Angular.
 - Angular can sometimes make implementation of custom behaviors require a lot of deep knownledge (of Angular). For instance when implementing a custom dropdown or a checkbox.
 - If you are cheeky, you could say:
    >Angular is a somewhat over engineered platform, while React is sometimes used to create over engineered apps.

My personal opinion is that as long as you can use the existing behavior of the standard components (buttons, checkboxes, dropdowns et.c.), Angular can be a good choice. I've yet to have been in a situation where management will settle on not implementing something just because it will create additional complexity: Why my feeling is that if you are given the choice, you should go for React.

I've used knockout for several years as well (and still like it as a library). My biggest issue is that I've found that the documentation (and the API) leads people into using computed properties when they don't need to. I would say that knockout is more well thought out than Angular (due to the smaller scope of the project). Due to the popularity of React compared to Knockout, I would guess that React would be a more natural choice.
