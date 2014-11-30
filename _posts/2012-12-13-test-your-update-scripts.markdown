---
layout: post
title:  "Test your update scripts"
date: 2012-12-13T16:14:00+01:00
tags: integration_test unit-test
---

This is a lesson I should have learned. It comes back to bite me and my coworkers ever so often. Running a script to update data without test is always quick and dirty. SSIS is a wonderful tool, but there are fundamental flaws to this tool as it's really hard to test SSIS packages. The beauty of using ruby or some other language (powershell, python, et.c.) is that you can write tests for the code. So, when you're doing yourself the favor of using ruby, write tests!
<div style="clear: both;"></div>