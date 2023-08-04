---
layout: post
title: Using multiple keyboard layouts on Windows 10
date: 2019-11-24T16:01:46+01:00
---

## Why

C style programming languages are designed in the cultural context of having a English keyboard layout. Programming C style languages on a Swedish keyboard layout is somewhat awkward since you need to exercise finger gymnastics in order to use common characters like `{}\`. Unless you switch to Python the easiest fix is to use multiple keyboard layouts.

## How

I started out by adding English (US) and then Swedish (Sweden) however, I ended up with a long list of keyboard layouts in the keyboard selection that comes up when you press WIN+space. Among those where layouts I couldn't figure out how they ended up there. A coworker helped me out by telling me that what I wanted is to use the English (UK) language but with US keyboard, since otherwise you will end up with additional UK keyboard layouts.

What I wanted was this configuration
 ![preferred languages](/img/2019-11-24-Using-multiple-keyboard-layouts-on-Windows-10/preferred-languages.png)

but for the UK language you add the US keyboard layout that you prefer:
 ![language options](/img/2019-11-24-Using-multiple-keyboard-layouts-on-Windows-10/language-options.png)

In my case it was the standard US keyboard layout:

 ![expected output](/img/2019-11-24-Using-multiple-keyboard-layouts-on-Windows-10/expected-output.png)

## UTF-8 issues in git-bash

A somewhat related issue is that you can have issues around locale in git bash. Following the [instructions on stackoverflow](https://stackoverflow.com/questions/10651975/unicode-utf-8-with-git-bash) should suffice.

## Ok, so now Windows has updated and I've got three keyboard layouts

 ![extra keyboard in menu](/img/2019-11-24-Using-multiple-keyboard-layouts-on-Windows-10/extra-keyboard-in-menu.png)

Note the extra keyboard layout and locale, could be for instance "English (United Kingdom)", and add that locale and keyboard in the Language parts of settings.

Add the extra keyboard so that you end up with the extra keyboard:

 ![temporary english UK and US keyboards](/img/2019-11-24-Using-multiple-keyboard-layouts-on-Windows-10/temporary-english-uk-and-us-keyboard.png)

Then go ahead and delete that keyboard while making sure that your currently selected keyboard is not that one.
