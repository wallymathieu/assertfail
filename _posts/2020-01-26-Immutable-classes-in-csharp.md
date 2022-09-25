---
layout: post
title: Immutable classes in C#
date: 2020-01-26T17:42:35+01:00
tags:  C#
comments:
  - author: Oskar Gewalli
    content: I've had [some trouble](https://github.com/wallymathieu/ImmutableObjectGraph-studies/pull/4) in getting ImmutableObjectGraph to work well in newer versions, but it looks very similar to the LanguageExt type of generation, why you could use that instead.
    date: 2020-03-02T11:57:35+01:00
  - author: Oskar Gewalli
    content: With the introduction of [C# 9 features](https://devblogs.microsoft.com/dotnet/welcome-to-c-9-0/) we will probably help bring immutability even more into the mainstream.
    date: 2020-05-23T18:55:05+01:00
---

## Problems

- How do you create an instance of a given readonly class?
- How do you get a new instance but with given fields with different values?

## Writing readonly record classes 2007

Around 2007 I wrestled with writing immutable classes in C#. One of the key painpoints was that the constructor parameters for a class representing a database row for a specific table ended up with around 68 parameters.

Note that we already had code generation of SQL Reader row deserialization based on SQL information tables.

This was before named parameters. In order to get around these limitations I wrote a small tool that used reflection in order to generate update expressions that could be copied into code (without worrying that a parameter was wrong). Once named parameters showed up, some of the pain went away.

The main benefit of having immutable classes that could not be modified was that it made the code base easier to reason about. This was a nice feature since the code represented many different aspects of managing, scheduling, teaching and attending schools in Denmark, i.e. there was a lot of code.

Another benefit is that immutable classes are safe to pass around in a multithreaded application.

## Helper tools around 2013

In order to simplify working with readonly classes I made a library around 2013 named [with](https://github.com/wallymathieu/with). Another approach explored by Andrew Arnott was to create code generator [Immutable object graph](https://github.com/AArnott/ImmutableObjectGraph).

You could also implement a t4 template in order to generate code.

Both of these approaches offered pros and cons. Main con of `with` was performance (though for I/O bound tasks, it's not going to be noticable). The main downside of the code generator was finicky to use.

Since libraries such as NHibernate supports immutable records, you could benefit from modelling readonly objects.

It was also fairly obvious that it was much easier to adopt a language that supports these concepts well out of the box (you might not be surprised that the somewhat mainstream language of choice then is F#). T4 templates where restricted to Windows, making some approaches nonportable.

## There are more options now (i.e. around 2019)

During 2019 I noticed how the implementation of many dependency injection containers where using `System.Linq.Expression` and compile expression into method. The previous fast implementations of DI containers used IL-emit. IL-emit does not seem to offer the same benefit as it did earlier. Using [expression compile](https://docs.microsoft.com/en-us/dotnet/api/system.linq.expressions.expression-1.compile?view=netframework-4.8) you can get the performance on par with hand written code.

Immutable Object Graph is still around and have merged pull requests.

The new alternative can be found in [LanguageExt](https://github.com/louthy/language-ext) CodeGen. The main downside or upside of this collection of libraries is that it is very non idiomatic C#.

We see that you get immutable objects generated from [autorest](https://github.com/Azure/autorest) and [OpenAPI generator](https://github.com/OpenAPITools/openapi-generator).

If you specify
```json
"readOnly":true
```

Autorest generates a constructor that takes the parameters:

``` C#
public partial class TodoItem
{
    /// <summary>
    /// Initializes a new instance of the TodoItem class.
    /// </summary>
    public TodoItem()
    {
        CustomInit();
    }

    /// <summary>
    /// Initializes a new instance of the TodoItem class.
    /// </summary>
    public TodoItem(double id, string text)
    {
        Id = id;
        Text = text;
        CustomInit();
    }

    /// <summary>
    /// An initialization method that performs custom operations like setting defaults
    /// </summary>
    partial void CustomInit();

    /// <summary>
    /// </summary>
    [JsonProperty(PropertyName = "id")]
    public double Id { get; private set; }

    /// <summary>
    /// </summary>
    [JsonProperty(PropertyName = "text")]
    public string Text { get; private set; }
...
```

while openapi-tools generates an empty constructor:
``` C#
/// <summary>
/// TodoItem
/// </summary>
[DataContract]
public partial class TodoItem :  IEquatable<TodoItem>, IValidatableObject
{
    /// <summary>
    /// Initializes a new instance of the <see cref="TodoItem" /> class.
    /// </summary>
    [JsonConstructorAttribute]
    public TodoItem()
    {
    }

    /// <summary>
    /// Gets or Sets Id
    /// </summary>
    [DataMember(Name="id", EmitDefaultValue=false)]
    public decimal Id { get; private set; }

    /// <summary>
    /// Gets or Sets Text
    /// </summary>
    [DataMember(Name="text", EmitDefaultValue=false)]
    public string Text { get; private set; }
    ...
```

We notice that the classes are declared partial.

This could then be combined with any of the above libraries or a t4 template. These templates now works outside of Windows as well.

## Microservices

We have seen a lot of interest around microservices style architectural patterns. Given a smaller size of a service, you have less need for immutable classes.

## Conclusion

Writing immutable classes have gotten better support in C# over the years. We see that you now have several options to pick from (without restrictions on operating system or performance).
