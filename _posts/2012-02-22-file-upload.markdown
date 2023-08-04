---
layout: post
title:  "File upload"
date: 2012-02-22T21:00:00+01:00
tags: JavaScript
---
The alternatives right now (2012-02-22):  
  
1. Standard html: File select together in a form that is submitted to a page. (firefox, chrome, IE)
2. Iframe hack: File select together with hidden iframe used to upload file. (firefox, chrome, IE)
3. Flash (all flash enabled browsers)
4. FileReader (firefox, chrome)

##

1. Drag and drop together with FileReader and ajax post.
2. File select together with FileReader and ajax post.

When building ordinary web applications then the first alternative is definitely the best. It's simple and works well. If you are building a more JavaScript intense application you are in a different mess. If you are supporting IE 7-9 then alternative 2 and 3 is what you are looking for. To enable the best experience you could sniff if the browser handles FileReader (since IE10 might support it) and enable a better experience in that case.

Note: I've only considered firefox, chrome and IE.
