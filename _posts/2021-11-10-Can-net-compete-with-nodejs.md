---
layout: post
title: Can .net compete with nodejs
date: 2021-11-10T07:42:31+01:00
tags:  F#  C# nodejs
---

NodeJS applications can be a single file with minimal overhead:
```JavaScript
const express = require('express')
const app = express()

app.get('/', (req, res) => { res.send('Hello World!') })

app.listen(3000, () => { })
```

How does this compare to what we have seen in the .net world?

## For .net 5 C#

### HelloWorld.csproj

```xml
<Project Sdk="Microsoft.NET.Sdk.Web">

  <PropertyGroup>
    <TargetFramework>net5.0</TargetFramework>
  </PropertyGroup>

</Project>
```

### Program.cs

``` C#
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

namespace HelloWorld
{
    public class Program
    {
        public static void Main(string[] args)
        {
            CreateHostBuilder(args).Build().Run();
        }

        public static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
                .ConfigureWebHostDefaults(webBuilder =>
                {
                    webBuilder.UseStartup<Startup>();
                });
    }
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        public void ConfigureServices(IServiceCollection services)
        {
        }

        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler();
            }
            app.Map("", b => b.Run(async context => await context.Response.WriteAsync("Hello world")));
        }
    }
}
```

the amount of ceremony has been reduced significantly compared to [asp.net 4](https://docs.microsoft.com/en-us/aspnet/web-forms/).

## .net 5 F#

In the F# space we have seen such libraries as [Suave](https://suave.io/), where you can write an fsx file containing:

``` F#
#r "nuget: Suave, 2.6.1"
open Suave

startWebServer defaultConfig (Successful.OK "Hello World!")
```

Note the relatively recent NuGet integration into the F# language that makes for a great scripting experience.

In [Giraffe](https://giraffe.wiki/) there has been a larger fluent configuration due to the  fact that it is implemented using asp.net core as the host.

## Towards minimal APIs

For C# the overhead of writing a minimal HTTP API would even more ceremony compared to F#. Perhaps due to the fact that there is competition in a wider world we see initiatives such as [Feather HTTP](https://github.com/featherhttp/framework) where you have:

``` C#
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;

var app = WebApplication.Create(args);

app.MapGet("/", async http =>
{
    await http.Response.WriteAsync("Hello World");
});

await app.RunAsync();
```

This style of application has been adopted into .net 6 where you then can have the following

### HelloWorld.csproj

```xml
<Project Sdk="Microsoft.NET.Sdk.Web">

  <PropertyGroup>
    <TargetFramework>net6.0</TargetFramework>
    <Nullable>enable</Nullable>
    <ImplicitUsings>enable</ImplicitUsings>
  </PropertyGroup>

</Project>
```

### Program.cs

``` C#
var app = WebApplication.Create(args);

app.MapGet("/", () => "Hello World");

app.Run();
```

These templates have been published on the [minimal api marketing page](https://minimal-apis.github.io/). Some of these improvements can also imply improvements for Giraffe.

## Startup performance

Building and starting a minimal .net API in C# takes a few seconds (around 4 seconds for .net 6 and around 7 seconds for .net 5 on my machine) while starting a minimal nodejs API on Windows takes at most 1 second. These numbers should be taken with a grain of salt. Once you have thousands of lines of TypeScript the performance to parse these can impose a significant overhead.

F# has the REPL going for it so you might not have the same need for startup performance. [Hot reload](https://devblogs.microsoft.com/dotnet/introducing-net-hot-reload/) takes only a few seconds (maybe 2 seconds on my machine) why that makes for a nicer experience.

## Conclusion

In a way the development experience when writing small web services has gotten significantly more along the lines of JavaScript. The experience is naturally different, but you can write code more in the same way.