---
layout: post
title:  "Is agile a developer-centric scam?"
date: 2012-07-15T16:25:00+02:00
tags: agile
---

[This article](http://adtmag.com/articles/2012/07/13/report-says-agile-a-scam.aspx) tells of a report where they suspect agile of being developer-centric scam in order for developers to avoid unwanted tasks:

```
In spite of the specialization of resources which limits the scope of the work of developers, the Agile movement might inspire and encourage developers to push back on processes, tools, documentation, and following plans,
```

```
Be aware that the Agile movement might very well just be either a developer rebellion against unwanted tasks and schedules or just an opportunity to sell Agile services including certification and training.
```

### Unwanted tasks like documentation

One assumption mentioned is that in order for a system to be maintainable you need documentation. This assumption is to broad to be of value. It depends on how easy it is to read the code. That is, the readability of the programming language determines if you need large amounts of documentation or not. The usual case is that even for complex systems, it can be detrimental. Adding documentation adds non executable text that needs to be in sync with other source code, that is executable text. Since the time spent developing software and debugging software is related to the amount of text in the associated source files, the time can increase without any benefit. For code that is hard to read: large regexp, assembly language, et.c. There is a benefit of good documentation.

Maybe it's an excuse to get more work done?

### Software engineering?

The other question is why do they make the contrast "developer-centric" with "software engineering"? [If there is such a thing as software engineering](http://www.cs.usfca.edu/~parrt/doc/software-not-engineering.html), then it _does not mean_ to be _oblivious_ of the core tools (programming languages) used to create software. The usefulness of a processes, such as documentation needs to be reevaluated with new capabilities of the tools.

### Processes and planning?

```
the Agile movement might inspire and encourage developers to push back on processes, tools, documentation, and following plans
```

I have personally been part of development where the processes and the planning made sure that very little could accomplished if you compare to a small focused development team without the overhead. Development time equals money. That kind of practice is not applicable for every software project.
Again, the conclusion could be that the people involved are just trying to be more effective and productive.

### Conclusion

Agile is a scam to lessen unwanted tasks that stifle productivity. Thus, it's a call to improve software development and help developers breathe more easily. For more information about agile read the [agile manifesto](http://agilemanifesto.org/).
