---
layout: post
title:  "File upload"
date: 2012-02-22T21:00:00+01:00
tags: javascript
---

The alternatives right now (2012-02-22):<br><br><ol>
<li>Standard html: File select together in a form that is submitted to a page. (firefox, chrome, IE)</li>
<li>Iframe hack: File select together with hidden iframe used to upload file. (firefox, chrome, IE)</li>
<li>Flash (all flash enabled browsers)
</li>
<li>FileReader 
(firefox, chrome)</li>
<ol>
<li>Drag and drop together with FileReader and ajax post. </li>
<li>File select together with FileReader and ajax post.</li>
</ol>
</ol>
<div>
When building ordinary web applications then the first alternative is definitely the best. It's simple and works well. If you are building a more javascript intense application you are in a different mess. If you are supporting IE 7-9 then alternative 2 and 3 is what you are looking for. To enable the best experience you could sniff if the browser handles FileReader (since IE10 might support it) and enable a better experience in that case.</div>
<div>
<br>
</div>
<div>
Note: I've only considered firefox, chrome and IE. </div>
<div style="clear: both;"></div>