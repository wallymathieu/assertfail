---
layout: post
title:  "Web versus native app login"
date: 2012-07-13T16:53:00+02:00
tags:
---

What are the most important differences between native applications and web applications (for mail, rss et.c.) when it comes to login?

Native applications usually store login information. For web applications this is dependant on the browser in order to store login form. Depending on application, there can be days between resubmition of credentials.

For unix applications there are alternatives like ssh shared keys. It enables connection from one machine (login) to another. It would be interesting if this approach could be reused for browser to web server communication. That is: generating a shared key for a single browser/machine. If you could generate a one time use string from the phone company in order to anonymize the identity? The identity of the user would still be transparent to ISP and other infrastructure providers. The setup to use a site from a new machine/login would be a hassle. For single use scenario: Maybe one session tokens sent to the phone when you are at an internet cafe?

Currently the alternatives are reduced to form fillers and password managers. Some browsers implement these features.
