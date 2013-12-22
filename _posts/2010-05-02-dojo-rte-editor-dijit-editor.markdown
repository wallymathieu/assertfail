---
layout: post
title:  "Dojo RTE editor (dijit Editor)"
date: 2010-05-02T11:43:00+02:00
categories: codeignite dojo javascript RTE
---

Finished upgrading an old site to use dojo and codeignite. In order to simplify things I added the RTE editor in order to simplify the code. There is no need to add logic related to the content on the page so html-content is preferable.<br><br>
excerpt from the content/editor.js: <br>
dojo.require("dijit.Editor");<br>
dojo.require("dijit.form.TextBox");<br>
dojo.require("dijit._editor.plugins.FontChoice");<br>
dojo.require("dijit._editor.plugins.LinkDialog");<br>
dojo.addOnLoad(function(){<br>
    dijit.byId('bodyeditor').setValue(dojo.byId('body').value);<br>
    dojo.query('[name="submit"]').onclick( function(evt) { <br>
        dojo.byId('body').value = dijit.byId('bodyeditor').getValue();<br>
    });<br>
});<br><br>
and from the view editor.php:<br>
&lt;style media="screen"&gt;<br>
#body{display:none;}<br>
#title{width:100%;}<br>
&lt;/style&gt;<br>
&lt;fieldset&gt;&lt;legend&gt;&lt;? echo $actiontitle ?&gt;&lt;/legend&gt;<br>
&lt;p&gt;&lt;label for="title"&gt;Titel:&lt;/label&gt;<br>
&lt;input type="text" id="title" dojoType="dijit.form.TextBox" name="title" required="true" value="&lt;? echo set_value('title',$title) ?&gt;"  /&gt;&lt;/p&gt;<br>
&lt;p&gt;&lt;label for="body"&gt;Body:&lt;/label&gt;<br>
&lt;textarea type="text" id="body" name="body"&gt;&lt;? echo set_value('body',$body) ?&gt;&lt;/textarea&gt;<br>
&lt;div dojoType="dijit.Editor" extraPlugins="[{name:'dijit._editor.plugins.FontChoice', command:'fontName', generic:true},{name:'dijit._editor.plugins.LinkDialog',command:'createLink'}]" id="bodyeditor" required="true"&gt; &lt;/div&gt;<br>
&lt;/p&gt;<br>
&lt;p&gt;&lt;div class="buttons"&gt;&lt;button type="submit" class="positive" name="submit" &gt;Ok&lt;/button&gt;&lt;/div&gt;&lt;/p&gt;<br>
&lt;/fieldset&gt;<br><br><br>
As you can see, I opted for the more declarative way. <br><br>
There were some pitfalls. I could not use the editor directly for instance. I had to define a hidden element for the content and post that element. Also, the declarative statement looks kind of ugly since we have to add the full name of the editor plugins.<br><br>
The first thing you notice of dojo is that the api isn't as slick as jquery. That is not expected since dojo spans more functionality. dojo shines however in one position: dojo.require. Like the import statement in java and python or the using statement in c#.
<div style="clear: both;"></div>