---
layout: post
title:  "Dojo RTE editor (dijit Editor)"
date: 2010-05-02T11:43:00+02:00
tags: javascript codeignite dojo
---

Finished upgrading an old site to use dojo and codeignite. In order to simplify things I added the RTE editor in order to simplify the code. There is no need to add logic related to the content on the page so html-content is preferable.  

excerpt from the content/editor.js:

~~~ javascript
dojo.require("dijit.Editor");  
dojo.require("dijit.form.TextBox");  
dojo.require("dijit._editor.plugins.FontChoice");  
dojo.require("dijit._editor.plugins.LinkDialog");  
dojo.addOnLoad(function(){  
    dijit.byId('bodyeditor').setValue(dojo.byId('body').value);  
    dojo.query('[name="submit"]').onclick( function(evt) {  
         dojo.byId('body').value = dijit.byId('bodyeditor').getValue();  
    });  
});
~~~

and from the view editor.php:  

<fieldset><legend>$actiontitle</legend>  
<p><label for="title">Titel:</label>  
<input type="text" id="title" dojoType="dijit.form.TextBox" name="title" required="true" value="<? echo set_value('title',$title) ?>" /></p>  
<p><label for="body">Body:</label>  
<textarea type="text" id="body" name="body"><? echo set_value('body',$body) ?></textarea>  
<div dojoType="dijit.Editor" extraPlugins="[{name:'dijit._editor.plugins.FontChoice', command:'fontName', generic:true},{name:'dijit._editor.plugins.LinkDialog',command:'createLink'}]" id="bodyeditor" required="true"> </div>  
</p>  
<p><div class="buttons"><button type="submit" class="positive" name="submit" >Ok</button></div></p>  
</fieldset>  

Note the dojoType attribute of the editor div:

~~~
dojoType="dijit.Editor" 
extraPlugins="[
    {
    name:'dijit._editor.plugins.FontChoice', 
    command:'fontName', 
    generic:true
    },{
    name:'dijit._editor.plugins.LinkDialog',
    command:'createLink'
    }]"
id="bodyeditor" required="true"
~~~


As you can see, I opted for the more declarative way.  

There were some pitfalls. I could not use the editor directly for instance. I had to define a hidden element for the content and post that element. Also, the declarative statement looks kind of ugly since we have to add the full name of the editor plugins.  

The first thing you notice of dojo is that the api isn't as slick as jquery. That is expected since dojo spans more functionality. dojo shines however in one position: dojo.require. Like the import statement in java and python or the using statement in c#.