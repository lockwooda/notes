# List Comprehension

Haskell has no for or while loop.

Haskell takes Lists as the iterable structure, so the construct for this is List Comprehension.
It is written in a way similar to that of COMP1215.

## Set Comprehension

We can define sets through set comphrension, such as $\{x^2 | x \in \{1, ..., 5\}\}$ which gets us $\{1, 4, 9, 16, 25\}$. We effectively iterate over the set and apply the operation given to the left of the such that symbol.

Haskell stays as close to the mathematics as it can so the syntax of List comprehension is similar.

``` haskell
factors :: Int -> [Int]
prime :: Int -> Bool
primesUpto :: Int -> [Int]

factors n = [ x | x <- [1..n], n `mod` x == 0]
prime n = factors n == [1, n]
primesUpto n = [ x | x <- [0..n], prime x]
```

## Zip

```  haskell
zip :: [a] -> [b] -> [(a,b)]
zip [] _ = []
zip _ [] = []
zip (x:xs) (y:ys) = (x,y) : zip xs ys
```

## General Form

``` haskell
[ exp | qual1, qual2, ..., qualn]
```

where exp is any expression and qual is one of pattern <- exp, exp where a guard is needed or a let declaration for locally declared values.

