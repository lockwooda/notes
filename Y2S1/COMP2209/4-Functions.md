# Defining Functions

## Basic Form

```haskell
function-name arg1 ... argN = body-expression
```

## Guarded Equations

Conditional statements are messy, especially when nested.
Define by cases on their values with guarded equations.

```
abs :: (Ord a, Num a) => a -> a
abs n | n >= 0 = n
	  | otherwise = -n
```

## Local Let Block

``` haskell
let name = expression in expression
aaa = let y = 1 + 2
          z = 4 + 6
          in y + z
```

## Pattern Matching

A simpler form of guarded equations it to consider a single particular value in the arguments or if it has a partitcular shape. We use pattern matching in these cases.

``` haskell
nonzero :: Int -> Bool
nonzero 0 = False
nonzero _ = True
```

