---
layout: post
title: What about Identity Server?
date: 2018-09-06T07:52:29+02:00
---

# So what has been my experience using [Identity Server](https://github.com/IdentityServer/IdentityServer4)?

I've (and others in my team) have worked on a project using Identity Server 4 since early 2017.

## What lead us there?

The main reason why we started to consider it was due to the main business goals:

 - To have a JWT provider that enables a single page application to communicate with a plethora of micro services
 - To use an existing solutions. The reasoning being that if the company used existing software, that would create a dependency on that software instead of senior developers.
 - To have a single provider of identity and accounts.
 - To have the provider of identity and accounts as a micro service.

We noticed that asp.net identity together with Identity Server satisfies a lot of the specific business requirements. 

## Initial experience

We got something working quite fast that satisfied the requirements. We had an login, authentication and OAuth solution within days.  

## What happened next

Our first stumbling block was that there was a need for a JSON API to use with a backoffice GUI that needed to be able to display accounts. Part of the trouble was that we needed mixed authentication: JWT and cookies. That turned out to be somewhat difficult with asp.net core mvc 1, but we eventually solved it. In asp.net core mvc 2 this has become much easier to configure.

Our next stumbling block was that there was a requirement that we could have a sign in flow from the single page application without disrupting the shopping experience. That requirement turned out to be more difficult to satisfy than the other requirements. In order to satisfy that we needed to dive deep into Identity Server in order to bend the opinions of Identity Server to the requirements.

## Conclusions

In hindsight, building such a solution on Identity Server turned out to be something of a mistake. My best bet right now is that Identity Server is more useful for server to server communication or when you want an OAUTH provider (and you are OK with the opinions of Identity Server). Another alternative is to relax one of the above requirements and use the Identity Server `site` as API gateway to internal services.

Another approach would have been sign JWT tokens directly without going through Identity Server. The tokens returned to the user could then have been validated by the services. The CTO at that time expressed a wish for the developers to use OAuth in order to be ready for native app development and to use an industry standard instead of something more homegrown.
