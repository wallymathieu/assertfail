---
layout: post
title:  "Running Rake under cygwin"
date: 2011-09-01T15:14:00+02:00
tags: cygwin rake
---

I had some problems with running rake under cygwin. I get the following error while trying to execute rake:  
C:\\Ruby192\\bin\\ruby.exe: No such file or directory -- /cygdrive/c/Ruby192/bin/rake (LoadError)  
  
Could it be that the problem is that the first line in rake:

```rb
#!/usr/bin/env ruby
```

Will return C:\\Ruby192\\bin\\ruby.exe  
  
By being more explicit about what to run you can avoid the problem:  
rake.bat
