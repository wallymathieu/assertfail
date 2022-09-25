---
layout: post
title: Validations in F# and C#
date: 2020-01-28T08:21:31+01:00
tags:  F#  C#
---

In order to give a nicer developer experience composing validation messages there are broad categories of libraries that either work well in a Java/C# style setting or work well when composing functions.

## Attribute based validation libraries

The default style that can be seen in many java and  C# projects is the attribute based validation approach.

``` C#
public class Person
{
  [MinLength(1,ErrorMessage ="NameBetween1And50"), MaxLength(50,ErrorMessage ="NameBetween1And50")]
  public string Name{get;set;}
  [EmailAddress(ErrorMessage ="EmailMustContainAtChar")]
  public string Email{get;set;}
  [Range(0,120,ErrorMessage = "AgeBetween0and120")]
  public int Age {get;set;}
}
```

it offers some nice advantages. Many frameworks integrate with these style of validations. You are somewhat limited in how you can apply validations, but it can be good enough.

In  F# it looks the following way:

``` F#
type Person = {
  [<MinLength(1,ErrorMessage ="NameBetween1And50"); MaxLength(50,ErrorMessage ="NameBetween1And50")>]Name : string
  [<EmailAddress(ErrorMessage ="EmailMustContainAtChar")>]Email : string
  [<Range(0,120,ErrorMessage = "AgeBetween0and120")>]Age : int
}
```

The main downside of this approach is that it is somewhat rudimentary and can require you to write somewhat verbose custom attributes for custom validations.

## Fluent configuration based libraries

We notice that using [FluentValidation](https://github.com/JeremySkinner/FluentValidation) we can separate the validation from the type declaration:

``` C#
public class PersonValidator : AbstractValidator<Person>
{
  public PersonValidator()
  {
    RuleFor(n => n.Name)
      .MinimumLength(1).WithErrorCode("NameBetween1And50")
      .MaximumLength(50).WithErrorCode("NameBetween1And50");
    RuleFor(n => n.Email).EmailAddress().WithErrorCode("EmailMustContainAtChar");
    RuleFor(n => n.Age).InclusiveBetween(0, 120).WithErrorCode("AgeBetween0and120");
    RuleForEach(n => n.Bookings).SetValidator(new BookingValidator());
  }
}
public class BookingValidator : AbstractValidator<Booking>
{
  public BookingValidator()
  {
    RuleFor(n => n.Description)
      .MinimumLength(1).WithErrorCode("DescriptionBetween1And50")
      .MaximumLength(50).WithErrorCode("DescriptionBetween1And50");
  }
}
```

In F# this style of validations could look the following:

``` F#
[<AutoOpen>]
module ValidationsMod=
  type IRuleBuilder<'T,'Property> with
    member __.__ = ()
module Person=

  type Person = { name : String
                  email : String
                  age : int }

  type PersonValidator()=
    inherit AbstractValidator<Person>()
    do
      base.RuleFor(fun n -> n.name)
          .MinimumLength(1).WithErrorCode("NameBetween1And50")
          .MaximumLength(50).WithErrorCode("NameBetween1And50")
          .__
      base.RuleFor(fun n -> n.email)
          .EmailAddress().WithErrorCode("EmailMustContainAtChar")
          .__
      base.RuleFor(fun n -> n.age)
          .InclusiveBetween(0,120).WithErrorCode("AgeBetween0and120")
          .__
```

We add a custom property `__` in order to end the fluent chain.

The fluent validations approach seems like a OK way to express your validations in C#, it's somewhat less elegant in F#, but looks OK.

## Computation Expression based configuration builders

The fluent style of building validators is somewhat clunky in F#, why you might want to wrap some of it in computation expression builders as can be seen in [AccidentalFish](https://github.com/JamesRandall/AccidentalFish.FSharp.Validation):


``` F#
let containsAt (s:string)= s.Contains("@")
let validateEmail (property:string) (value:string)=
  if (containsAt value)
  then Ok
  else Errors([{ message="EmailMustContainAtChar";errorCode="EmailMustContainAtChar"; property=property }])
let validatePerson = createValidatorFor<Person>() {
  validate (fun r -> r.age) [
    isGreaterThanOrEqualTo 0
    isLessThanOrEqualTo 120
  ]
  validate (fun r -> r.name) [
    isNotEmpty
    hasMaxLengthOf 128
    hasMinLengthOf 1
  ]
  validate (fun r -> r.email) [validateEmail]
}
```

You could also define a CE builder for FluentValidator (though that we leave as an exercise to the reader). We could see the CE approach as an F# specific alternative to using fluent builder pattern.

## Applicative composition based libraries

Using applicative composition based libraries such as [F#+](https://github.com/fsprojects/FSharpPlus/) you are not limited to the API limitations above. You can have a strict type for validation errors that composes well.

``` F#

type Name = { unName : String }
with static member create s={unName=s}
type Email = { unEmail : String }
with static member create s={unEmail=s}
type Age = { unAge : int }
with static member create i={unAge=i}

type Person = { name : Name
                email : Email
                age : Age }
with static member create name email age={name=name;email=email;age=age }


type Error =
  | NameBetween1And50
  | EmailMustContainAtChar
  | AgeBetween0and120

let mkName s =
  let l = length s
  if (l >= 1 && l <= 50)
  then Success <| Name.create s
  else Failure  [ NameBetween1And50 ]

let mkEmail s =
  if String.contains '@' s
  then Success <| Email.create s
  else Failure [ EmailMustContainAtChar ]

let mkAge a =
  if (a >= 0 && a <= 120)
  then Success <| Age.create a
  else Failure [ AgeBetween0and120 ]

let mkPerson pName pEmail pAge =
  Person.create
  <!> mkName pName
  <*> mkEmail pEmail
  <*> mkAge pAge
```

The main point comes from the `mkPerson` function that composes the different validation functions into a function that either returns `Success of Person` or `Failure of Error list`.

The main downside of this approach is that it requires you to accept that you can glue functions toghether in this way. Since many validation libraries come prepared with some basic validations for strings and numbers, you might also want to define a collection of validation helper functions that suits your needs.

This approach allows you to strictly define the kind of validation errors that a given part of your code can return. This has some really nice benefits when you want to communicate these to another team.

## Conclusion

Validations can be expressed in different ways. There are a few main ways of encoding the validators. For F# we see an additional way of composing functions instead of using builder patterns or gluing attributes to the types that you want to validate. My impression is that it's not a clear choice unless you add preferences to the mix.
