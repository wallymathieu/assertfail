---
layout: post
title: BDD style testing in qunit
date: 2015-08-31T10:52:38+02:00
tags: bdd javascript
---

Before the vacation I was working with [Karl Adriansson](https://twitter.com/HerrAdriansson) on a project as the front end programmer. I helped get a front end javascript parts back on track. While doing this, Karl and one of the testers supplied me with specifications from the requirements. Since the specifications where very detailed, It was very easy to transform them into sort of BDD style tests:

```
test("PROJ-783", function (){
  var ctx = given_a_customer_previously_bought(black_sweater());
  and_I_currently_have_X_of_Y_in_stock(ctx, 3, black_sweater());
  when_he_returns_product_X_for_refund(ctx, black_sweater());
  then_I_should_have_X_of_Y_products_in_stock(ctx, 4, black_sweater());
});
```

Note that I've taken the specification from [wikipedia](https://en.wikipedia.org/wiki/Behavior-driven_development) in order to have a meaningful sample. We used the convention of writing the jira id as the test name in order to know from where the specification came.

Since we are using ordinary language constructs (methods that take parameters), the level of abstraction here is relatively low. Many of the helper methods can in many cases be reused since you might have many specifications related to the same subdomain. Some of the helper methods will only be used once. In some cases you might want to drop some of the prefixes in order to avoid to much duplication.

