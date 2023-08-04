---
layout: post
title: Goto considered harmful
date: 2015-02-23T00:30:11+01:00
---

Dijkstra wrote the [following](http://www.u.arizona.edu/~rubinson/copyright_violations/Go_To_Considered_Harmful.html). I agree with his reasoning.

However, goto is useful in certain lower level domains.

The difficulty of reading code with goto statements is that it's hard to follow the program flow.

The reasoning can also be applied to programming where you do not use goto.

Consider the following code:

```c
someMethod(){
    // some state
    label 1:
        doStuff();
        goto end;
    label 2:
        if (condition){
            goto 1;
        }else{
            doOtherStuff();
            goto end;
        }
    label 3:
        doSomeDifferentThings();
        goto end;
...
    end:
}
```

How do you emulate the above code in a language without goto? You could use a while and a switch.

```c
    someMethod(){
        // some state
        going = true;

        while(going){
          switch (goTo){
          case 1: going=false;
              doStuff(); break
          case 2: going=false;
            if (condition){
                  going=true; goTo=1;
            }else{
                doOtherStuff();
            }
            break;
          case 3: goin =false;
              doSomeDifferentThings();
            break;
        ...
          }
        }
    }
```

How do you emulate the above goto in a language with objects but without switch?

```java
Object ThatDoesSomeThing{
    // some state
    public someMethod(){
        line_1();
        ...
    }

    private line_1(){
        doStuff();
    }
    private line_2(){
        if (condition){
                line_1();
        }else{
            doOtherStuff();
        }
    }
    private l_3(){
        doSomeDifferentThings();
    }
    ...
}
```

From [stackoverflow](http://stackoverflow.com/questions/1487124/translate-goto-statements-to-if-switch-while-break-etc):

```java
    public someMethod(){
        int goTo=0;
        while(true){
          switch(goTo){
          case 0:
            doSomething();
            goTo = 1;
            continue;
          case 1:
            doSomethingElse();
            goTo = 2;
            continue;
          case 2:
            doSomethingDifferent();
            goTo = 0;
            continue;
          default:
            return;
          }
        }
    }
```

This translates into:

```java
    Object ThatDoesSomeThing{
        // some state
        public someMethod(){
            line_0();
        }

        private line_0(){
            doSomething();
            line_1();
        }
        private line_1(){
            doSomethingElse();
            line_2();
        }
        private line_2(){
            doSomethingDifferent();
            line_1();
        }
    }
```

The main thing is the usage, not the keyword. Goto is an easy target because it's famous for being bad. This is cargo cult programming. It's easy to write an unreadable mess in many ways. In the above examples it might be due to the fact that it's difficult to follow how the state of the context will be for any line.

The important thing to ask yourself is why is some code harder to read? How do you write readable code? How do you write good texts?
