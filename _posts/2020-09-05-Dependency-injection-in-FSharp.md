---
layout: post
title: Dependency injection in FSharp
date: 2020-09-05T11:19:06+02:00
tags: f#
---

One of the questions around how to write F# is how do we compose bigger business applications. In C# you generally use constructor injection.

Let us start by defining some base functions types and environment that we will use in later code samples:

```f#
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

```f#
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

Another way to decompose your program is to use currying:

```f#
let getUser (repo:IUserRepository) email = repo.GetUser email

let addShoppingList (repo : IShoppingListRepository) shoppingList = async { return repo.Add shoppingList }

let addShoppingListM (getUser: string -> Async<string>) (addShoppingList:string list -> Async<string list>) email = monad {
    let! user = getUser email
    let shoppingList = ["s"]
    return! addShoppingList shoppingList
}

let composeAddShoppingListM ()=
    let env = Env()
    let userRepository=env :> IUserRepository
    let shoppingListRepository=env :> IShoppingListRepository
    let getUser = getUser userRepository
    let addShoppingList = addShoppingList shoppingListRepository
    addShoppingListM getUser addShoppingList

let addToShoppingListC = composeAddShoppingListM ()
addToShoppingListC "a@a"
|> fun listA -> async {
    let! list = listA
    printfn "%A" list
    } |> Async.Start
```

In the above example we reused the same class `Env` in order to keep the code shorter.

Since F# allows for nice OO programming you can use dependency injection via constructor injection:

```f#
type ShoppingService (userRepository:IUserRepository, shoppingListRepository:IShoppingListRepository)=

    let getUser email = userRepository.GetUser email

    let addShoppingList shoppingList = async { return shoppingListRepository.Add shoppingList }

    member __.AddShoppingListM email = monad {
        let! user = getUser email
        let shoppingList = ["s"]
        return! addShoppingList shoppingList
    }

let env = Env()
let userRepository=env :> IUserRepository
let shoppingListRepository=env :> IShoppingListRepository
let shoppingService = ShoppingService (userRepository, shoppingListRepository)

shoppingService.AddShoppingListM "a@a"
|> fun listA -> async {
    let! list = listA
    printfn "%A" list
} |> Async.Start
```

I usually write F# with a mix of currying and constructor injection, but using `ReaderT` seems like a nice alternative.