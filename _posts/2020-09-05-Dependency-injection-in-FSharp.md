---
layout: post
title: Dependency injection in FSharp
date: 2020-09-05T17:11:06+02:00
tags: F#
comments:
  - author: Oskar Gewalli
    content: The most educational source around F# and dependency injection is [F# for fun and profit](https://fsharpforfunandprofit.com/posts/dependencies/). It's part of the 2020 advent calendar and is a great source with links to other well written posts.
    date: 2021-02-07T13:05:43+01:00
  - author: Oskar Gewalli
    content: There is also this post that looks nice [Dealing with complex dependency injection in F#](https://bartoszsypytkowski.com/dealing-with-complex-dependency-injection-in-f/)
    date: 2022-04-12T06:25:43+02:00
---

One of the questions around how to write F# is how do we compose bigger business applications. In C# you generally use constructor injection.

Let us start by defining some base functions types and environment that we will use in later code samples:

``` F#
open FSharpPlus
open FSharpPlus.Data

type IUserRepository =
    abstract GetUser : email : string -> Async<string>

type IShoppingListRepository =
    abstract Add : shoppingList : string list -> string list
type Env() =
    interface IUserRepository with
        member this.GetUser email =
            async { return "Sandeep"}
    interface IShoppingListRepository with
            member this.Add shoppingList =
                shoppingList
```

One example is to use ReaderT in to be able to provide a bag of dependencies as seen [on gitter](https://gitter.im/fsprojects/FSharpPlus?at=5eba11635a0bc5394637de8e
) and [here](https://www.youtube.com/watch?v=pxJCHJgG8ws&ab_channel=F%23Online):

``` F#
let getUser email =
    ReaderT(fun (env : #IUserRepository) -> env.GetUser email )

let addShoppingList shoppingList =
    ReaderT(fun (env : #IShoppingListRepository) -> async { return env.Add shoppingList })

let addShoppingListM email = monad {
    let! user = getUser email
    let shoppingList = ["s"]
    return! addShoppingList shoppingList
}

ReaderT.run (addShoppingListM "a@a")  (Env())
|> fun listA -> async {
    let! list = listA
    printfn "%A" list
} |> Async.Start
```

There is also a post about using [reader monad for dependency injection](https://bartoszsypytkowski.com/dealing-with-complex-dependency-injection-in-f/) but without using more advanced techniques such as monad transformers.

Another way to decompose your program is to use currying as seen on [F# for fun and profit](https://fsharpforfunandprofit.com/posts/dependency-injection-1/):

``` F#
let getUser (repo:IUserRepository) email = repo.GetUser email

let addShoppingList (repo : IShoppingListRepository) shoppingList = async { return repo.Add shoppingList }

let addShoppingListM (getUser: string -> Async<string>) (addShoppingList:string list -> Async<string list>) email = monad {
    let! user = getUser email
    let shoppingList = ["s"]
    return! addShoppingList shoppingList
}

let composeAddShoppingListM ()=
    let env = Env()
    let getUser = getUser (env :> IUserRepository)
    let addShoppingList = addShoppingList (env :> IShoppingListRepository)
    addShoppingListM getUser addShoppingList

let addToShoppingListC = composeAddShoppingListM ()
addToShoppingListC "a@a"
|> fun listA -> async {
    let! list = listA
    printfn "%A" list
    } |> Async.Start
```

In the above example we reused the same class `Env` in order to keep the code shorter. You need to have some glue, why it might not be suitable for a solution where you have a lot of functions with a lot of dependencies.

Since F# allows for nice OO programming you can use dependency injection via constructor injection:

``` F#
type Shopping (userRepository:IUserRepository, shoppingListRepository:IShoppingListRepository)=

    let getUser email = userRepository.GetUser email

    let addShoppingList shoppingList = async { return shoppingListRepository.Add shoppingList }

    member __.AddShoppingListM email = monad {
        let! user = getUser email
        let shoppingList = ["s"]
        return! addShoppingList shoppingList
    }

let env = Env()
let shopping = Shopping (env :> IUserRepository, env :> IShoppingListRepository)

shopping.AddShoppingListM "a@a"
|> fun listA -> async {
    let! list = listA
    printfn "%A" list
} |> Async.Start
```

I usually write F# with a mix of currying and constructor injection and have not tried out using reader monad for service dependencies. The use of `ReaderT` lets you remove the amount of parameters you might otherwise need to pass around. One of the neat things about using a monad transformer is that you can then compose it with your base monad that you otherwise use extensively such as `async`.
