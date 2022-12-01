---
layout: post
title: Keeping a library in dotnet binary compatible for several years
date: 2022-12-01T21:04:52+02:00
tags: F# .net
---

## Background

I'm one of the people contributing to [F#+](https://github.com/fsprojects/FSharpPlus). I got involved in the library around 2017 since I was looking for computation expression builders to clean up my F# code (after a few turns that turned out to be F#+).

Around 2018 we released the v1 version. Since then we have released minor versions of the library with new features and bug fixes.

In order to not break any users (such as our own usage) we try as far as possible to be backwards compatible.

## Running tests against an old version

How do you do that? We have created a project that compiles a copy of the tests against the v1.0 release. Then we include those tests in the test execution with the current version of F#+. This means that the DLLs will be pulled up to the current version even though the project compiled against an old version.

The fsproj for the project that references F#+ 1 looks like:

```xml
<Project Sdk="Microsoft.NET.Sdk">
  <PropertyGroup>
    <TargetFrameworks>netstandard2.0;net461</TargetFrameworks>
    <RootNamespace>FSharpPlus.One</RootNamespace>
  </PropertyGroup>

  <ItemGroup>
    <!-- ... -->
    <PackageReference Include="FSharpPlus" Version="1.0.0" />
    <!-- ... -->
  </ItemGroup>

</Project>
```

While the actual test project will reference the above like:

```xml
<?xml version="1.0" encoding="utf-8"?>
<Project Sdk="Microsoft.NET.Sdk">
  <PropertyGroup>
    <!-- ... -->
    <IsPackable>false</IsPackable>
  </PropertyGroup>
  <ItemGroup>
    <!-- ... -->
  </ItemGroup>
  <ItemGroup>
    <ProjectReference Include="..\..\src\FSharpPlus\FSharpPlus.fsproj">
      <Private>True</Private>
    </ProjectReference>
    <ProjectReference Include="..\FSharpPlus.1\FSharpPlus.1.fsproj" />
    <!-- ... -->
  </ItemGroup>
</Project>
```

Note the reference to both the project that references F#+ 1 and a reference to F#+ currently being built (project reference).

This will allow us to see binary incompatibilities between v1.0.0 and the current version.

## Binary compatibility with SRTP

Since there is a lot of SRTP, the compiled version of F#+ will actually be binary compatible due to usage of SRTP being erased after compilation.

Since a lot of the API's are not used directly by the user, but gets referenced by the compiled code we can declare overloads that are not used (by SRTP) in later minor versions of F#+.

This means that we can have methods as seen here:

```f#
type MapIndexed =
    // ...
    // Begin compat members
    // ...
    static member MapIndexed (x: 'T []      , f            , [<Optional>]_impl: MapIndexed) = Array.mapi f x
    // ...
    // End compat members
```

but that the new versions have the following signature:

```f#
    // ...
    static member MapIndexed ((x: 'T []      , f            ), [<Optional>]_impl: MapIndexed) = Array.mapi f x
```

Note the extra paranthesis. The compat members are referenced by the v1 version, while an updated version with overload fixes uses the lower form. Since user code will reference select the right overload through SRTP, the compiled code just need to have one of the above.

This has allowed us to do what normally would mean an incompatible change of the API, but let us keep the compiled binary signature (minus SRTP usage).

## Hiding but keeping old APIs

By adding the attribute `EditorBrowsable(EditorBrowsableState.Never)` we tell the editor to not show types and methods when using intellisense.

One of the examples are the v1 Builders module:

```f#
[<Obsolete("Compatibility with v1"); EditorBrowsable(EditorBrowsableState.Never)>]
module Builders =
  //..
```

## Conclusion

Using these facts of F# we have been able to keep a major version going for way longer than I would have thought possible while still being able to accomodate significant changes.
