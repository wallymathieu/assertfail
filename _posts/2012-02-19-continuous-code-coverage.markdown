---
layout: post
title:  "Continuous code coverage"
date: 2012-02-19T17:54:00+01:00
tags: JavaScript code_coverage
---

What if we could do a continuous code coverage? That is, while debugging and testing the app, storing the coverage information. A first version would consider lines that are not changed as covered if they have been executed during previous runs. This could be a sort of blunt tool to help isolate code that should be flagged either for removal, for code review, automatic or manual testing.<br><br>
It should be simple enough to <a href="https://github.com/wallymathieu/js_codecover_reporting">send information</a> about code coverage when running JavaScript code. The challenge is to map the coverage information with source lines and keeping some sort of data structure that represents the code and coverage information that can be updated with the old coverage information form previous versions of the code.
<div style="clear: both;"></div>