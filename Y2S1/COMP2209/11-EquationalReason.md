# Equational Reasoning

We can think of programs as an algebra. We take the set of all programs that you can legally form from the grammar, take the operations to be programming language consructs and now the equations that exist between terms.

In Haskell, everything is defined equationally.

## List Example

``` haskell
reverse :: [a] -> [a]
reverse [] = []
reverse (x:xs) = reverse xs ++ [x]

reverse [x]
= { syntactic sugar }
reverse (x:[])
= { defn of reverse }
reverse [] ++ [x]
= { defn of reverse }
[] ++ [x]
= {defn of ++}
[x]
```

## Proof by Induction

To prove $P(n)$ for all $n$, we prove $P(0)$ and then prove for any $k$ that $P(k+1)$ holds under the assumption that $P(k)$ holds.

### Proof on type Nat

```haskell
data Nat = Zero | Succ Nat
```

To prove $P(n)$ holds for all values we prove P(Zero) and P(Succ x) under the assumption of P(x).
We are going to prove that add is associative.

``` haskell
add :: Nat -> Nat -> Nat
add Zero m = m
add (Succ n) m = Succ (add n m)

-- base case
add Zero (add y z)
= { defn of add }
add y z
= { defn of add backwards}
add (add Zero y) z

-- inductive cases
add (Succ x) (add y z)
= { defn of add }
Succ (add x (add y z))
= { inductive hypothesis }
Succ (add (add x y) z)
= { defn of add backwards }
add (Succ (add x y) z)
= { defn of add backwards }
add (add (Succ x) y) z)
```

## Induction on Structure

We can use proof by induction on any structured data type.
Its roughly as follow:

To prove $P(x)$ for all values in type T it is sufficient to prove:

* $P(C)$ for all constructors C in T with no recursive arguments
* $P(F \text{ } x)$ assuming that $P(x)$ holds for all constructors F in T that have a single recursive argument
* $P(G\text{ }x\text{ }y)$ assuming that $P(x)$ and $P(y)$ hold for all constructors G in T that have two recursive arguments
* etc...

## Induction on Lists

This allows us to prove properties over any algebraic data types we define.

To prove a property P(xs) for all lists we must prove:

* P([])
* P(x:xs) under the assumption of P(xs)

### Proof that Reverse is Involutive

Showing that for all xs:

``` haskell
reverse (reverse xs) = xs

-- base case
reverse (reverse [])
= { defn of reverse }
reverse []
= { defn of reverse }
[]

-- inductive case (x:xs)
reverse (reverse (x:xs))
= { defn of reverse }
reverse (reverse xs ++ [x])
= { distributivity of reverse and ++ }
(reverse [x]) ++ reverse (reverse xs)
= { reverse of singleton }
[x] ++ reverse (reverse xs)
= { inductive hypothesis }
[x] ++ xs
= (x:[]) ++ xs = x : ([] ++ xs) = x:xs
```