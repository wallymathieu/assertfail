---
layout: post
title: Why global installation of packages?
date: 2015-02-07T08:35:37+01:00
tags: 
---

What do I mean when I say?
- System level package / Global package: Package installed so that it is available for every program on the system
- Local package: Package installed into sub folder of project and only available to that project 

Timeline
- [dpkg 1994](http://anonscm.debian.org/gitweb/?p=dpkg/dpkg.git;a=blob;f=scripts/perl-dpkg.pl;h=ba70fc5f570ed2cd3661a505f642aa85d2295ab5;hb=1b80fb16c22db72457d7a456ffbf1f70a8dfc0a5) 
- [cpan, uploaded packages from 1995](http://web.archive.org/web/20000816230719/http://www.cpan.org/modules/01modules.index.html)
- [jar 1996](http://en.wikibooks.org/wiki/Java_Programming/History)
- [debian release with apt 1999](http://dictionary.sensagent.com/advanced+packaging+tool/en-en/)
- [perl package manager goes back to at least 2000](https://metacpan.org/pod/release/MURRAY/PPM-2.1.3/lib/PPM.pm)
- [rubygems 2004](https://github.com/rubygems/rubygems/blob/master/History.txt)
- [ruby bundler 2010, git history from 2010, ruby gem from 2009](https://rubygems.org/gems/bundler/versions)
- [npm 2010](https://github.com/npm/npm/releases/tag/v0.0.1)
- [nuget 2010](http://nuget.codeplex.com/wikipage?version=1)

This is just a sampling of when different packaging solutions appeared. My impression is that the first solutions where focused on system level package management. RubyGems and similar package managers came out of that context. I don't know if it's a coincidence but it looks like local package management tools started to appear first around 2010.

Global installation of packages probably dates back to system level packages. Since disk space is cheaper, there is no longer the same need to share packages among programs and services.