---
layout: post
title: What about Identity Server?
date: 2018-09-06T07:52:29+02:00
---

The business goals have been:

 - To have a JWT provider that enables a single page application to communicate with a plethora of micro services
 - To use an existing solutions. The reasoning being that if the company used existing software, that would create a dependency on that software instead of senior developers.
 - To have a single provider of identity and accounts.
 - To have the provider of identity and accounts as a micro service.

We noticed that asp.net identity satisfies a lot of the specific business requirements. 

We got something working quite fast that satisfied the requirements. 

Our first stumbling block was that we needed a JSON API for backoffice purposes to access the accounts. Part of the trouble was that we needed mixed authentication: JWT and cookies. That turned out to be somewhat difficult with asp.net core mvc 1, but we eventually solved it. In asp.net core mvc 2 this has become much easier to configure.

Our next stumbling block was that there was a requirement that we could have a sign in flow from the single page application without disrupting the shopping experience. That requirement turned out to be more difficult to satisfy than the other requirements. In order to satisfy that we needed to dive deep into Identity Server in order to bend the opinions of Identity Server to the requirements.

## Conclusions

In hindsight, building such a solution on Identity Server turned out to be something of a mistake. My best bet right now is that Identity Server is more useful for server to server communication or when you want an OAUTH provider (and you are OK with the opinions of Identity Server). Another alternative is to relax one of the above requirements and use the Identity Server `site` as API gateway to internal services.
