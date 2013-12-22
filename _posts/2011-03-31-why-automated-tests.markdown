---
layout: post
title:  "Why automated tests?"
date: 2011-03-31T23:14:00+02:00
categories: unit-test
---

<div dir="ltr" style="text-align: left;" trbidi="on">
<ol style="text-align: left;">
<li>Work is more fun when the things you create mostly works.</li>
<li>When fixing bugs, the probability of introducing new bugs is reduced.</li>
<li>Specifications of program behavior expressed as tests are easier to maintain than tutorial code or a word document specification.</li>
<li>In order to be able to write unit tests easier you are forced to simplify your classes. </li>
<li>Switching underlying technology or infrastructure. For example: If you have integration tests on your database repositories or data access layers it is easier to switch the underlying implementation. You have a way of verifying that important behavior is intact. </li>
<li>If you are writing code that:<ul>
<li>Requires the use of the debugger frequently.</li>
<li>After you have written it, you fear to change.</li>
</ul>
<ol></ol>
Do you really consider yourself a professional developer? 
</li>
</ol>
<div>
Some of it is in relation to having to work late at night and during weekends. Tests can help you with your definition of done, thus alleviating the need for late night coding sessions.<br><br>
Effective coding means to use the tools available when they are appropriate.<br><br>
Sometimes it's about doing something simple:<br><ol style="text-align: left;">
<li>Is the bug to complex to find using tests? The flow of the application is wrong...</li>
</ol>
<ul>
<li>Maybe you could find it easier if you use a logger to trace the behavior?</li>
</ul>
<li>You have written a test that recreates the problem, but you cant figure out why it doesn't work.</li>
<ul>
<li>Maybe putting breakpoints and debugging your test will help you find what's wrong.</li>
</ul>
<div>
If you're a beginner. How do you start writing tests?</div>
<div>
<ol style="text-align: left;">
<li>If you're writing c# then you want to read <a href="http://www.amazon.com/Art-Unit-Testing-Examples-Net/dp/1933988274">"the art of Unit Testing"</a> by Roy Osherove. </li>
<li>If you're unsure about how to write tests. Try using <a href="http://www.typemock.com/test-lint">test lint</a>.</li>
<li>Search posts done by <a href="http://martinfowler.com/">Martin Fowler</a>, <a href="http://www.threeriversinstitute.org/blog/">Kent Beck</a>, <a href="http://cleancoder.posterous.com/">Robert C. Martin (Uncle Bob)</a>, <a href="http://michaelfeathers.typepad.com/michael_feathers_blog/">Michael Feathers</a> .</li>
<li>How do you do when you test your code manually?</li>
<ol>
<li>You set up the state of the program relevant before the method/procedure to test. In Nunit it's called SetUp. You use this attribute to mark the method that sets up the state.</li>
<li>You fill in a form and click on a button, browse to a page with the right parameters in the url, et.c. When testing this is the actual test. You mark a method that does this by the Test attribute.</li>
<li>You look at the result from the action. In Nunit you use the static helper class Assert that contains methods to help you write the expected values.</li>
<li>After you're finished testing, you may need to clean up. In Nunit this is accomplished by marking the a method with the attribute CleanUp.</li>
</ol>
If you are structured in your testing of your app you may know some of the domain of automatic testing. You can read about this in the above book by Roy Osherove.</ol>
<div>
Also, writing tests is not a reason not to test what you've written manually. It is a way to make sure that you don't have to do as much manually testing as before. </div>
</div>
</div>
</div>
<div style="clear: both;"></div>