---
layout: post
title: Render xml as html
date: 2015-02-07T07:20:01:+01:00
---

Sometimes when working with xml you have more information in the xml file than you know what to do with in your code. It could be new tags or attributes. A way to use the xml you have not anticipated in your code. A simple way to present that information to the user (so that they can inform you when you're doing wrong) is to apply a [general xml stylesheet](https://gist.github.com/wallymathieu/8dcc3055b36422d3a504).

First part of the trick is to tell xml that you intend to output html:

```
<xsl:output ... method="html" omit-xml-declaration="yes"/>
```

Next step is to create a root html (in order to be able to add style and scripts). In order to apply the rest o our xsl templates we need to apply the other templates:

```
<xsl:template match="/">
<html>
...
    <xsl:apply-templates/>
</html>
```

To render all the child-nodes we do the following:

```
<xsl:template match="node()">
...
```

Any attributes? By using @* we can pick out the xml attributes. If they show different intent it could be that we want to style them differently. 

```
<xsl:if test="@*">
```

Any child nodes?

```
<xsl:if test="node()">
```

One thing you could do is to pass along the nesting as a parameter to the templates. Then you can add a different class to depending on how deep the element is.

If you want to call a template with parameters:
```
<xsl:call-template name="some-template">
    <xsl:with-param name="value" select="."/>
</xsl:call-template>
```

```
<xsl:template name="some-template">
    <xsl:param name="value"/>
    ...
```


Xml style sheets are a bit weird to work with. Theyshould probably be avoided for many tasks. However, for some problems they can be quite useful.