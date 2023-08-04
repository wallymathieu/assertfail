---
layout: post
title:  "Why automated tests?"
date: 2011-03-31T23:14:00+02:00
tags: unit-test
---

1. Work is more fun when the things you create mostly works.
2. When fixing bugs, the probability of introducing new bugs is reduced.
3. Specifications of program behavior expressed as tests are easier to maintain than tutorial code or a word document specification.
4. In order to be able to write unit tests easier you are forced to simplify your classes.
5. Switching underlying technology or infrastructure. For example: If you have integration tests on your database repositories or data access layers it is easier to switch the underlying implementation. You have a way of verifying that important behavior is intact.
6. If you are writing code that:
    * Requires the use of the debugger frequently.
    * After you have written it, you fear to change.

    Do you really consider yourself a professional developer?

Some of it is in relation to having to work late at night and during weekends. Tests can help you with your definition of done, thus alleviating the need for late night coding sessions.

Effective coding means to use the tools available when they are appropriate.

Sometimes it's about doing something simple:

1. Is the bug to complex to find using tests? The flow of the application is wrong...

* Maybe you could find it easier if you use a logger to trace the behavior?

* You have written a test that recreates the problem, but you cant figure out why it doesn't work.

* Maybe putting breakpoints and debugging your test will help you find what's wrong.

If you're a beginner. How do you start writing tests?

1. If you're writing C# then you want to read ["the art of Unit Testing"](http://www.amazon.com/Art-Unit-Testing-Examples-Net/dp/1933988274) by Roy Osherove.
2. If you're unsure about how to write tests. Try using [test lint](http://www.typemock.com/test-lint).
3. Search posts done by [Martin Fowler](http://martinfowler.com/), [Kent Beck](http://www.threeriversinstitute.org/blog/), [Robert C. Martin (Uncle Bob)](http://cleancoder.posterous.com/), [Michael Feathers](http://michaelfeathers.typepad.com/michael_feathers_blog/) .
4. How do you do when you test your code manually?

    1. You set up the state of the program relevant before the method/procedure to test. In NUnit it's called SetUp. You use this attribute to mark the method that sets up the state.
    2. You fill in a form and click on a button, browse to a page with the right parameters in the url, et.c. When testing this is the actual test. You mark a method that does this by the Test attribute.
    3. You look at the result from the action. In NUnit you use the static helper class Assert that contains methods to help you write the expected values.
    4. After you're finished testing, you may need to clean up. In NUnit this is accomplished by marking the a method with the attribute CleanUp.

If you are structured in your testing of your app you may know some of the domain of automatic testing. You can read about this in the above book by Roy Osherove.

Also, writing tests is not a reason not to test what you've written manually. It is a way to make sure that you don't have to do as much manually testing as before.