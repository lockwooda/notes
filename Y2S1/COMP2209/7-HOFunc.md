# Higher-Order Functions

A function is higher-order if it takes a function as an argument or returns a function as a result.

We can rewrite many function down into one function in order to simplify our code down.

## Map

Map applies a given operation to every element in a list

``` haskell
map :: (a -> b) -> [a] -> b
map f [] = []
map f (x:xs) = f x : map f xs

doubleList xs = map (2*) xs
squareList xs = map (^2) xs
negateList xs = map (0-) xs
```

## Filter

A function that filters based upon a query.

``` haskell
filter :: (a -> Bool) -> [a] -> [a]
filter p [] = []
filter p (x:xs)
    | p x = x : filter p xs
    | otherwise = filter p xs
   
filter p xs = [ x | x <- xs, p x]

filter even [1,2,3,4,5] = [2,4]
filter (>3) [1,2,3,4,5] = [4,5]
```

## Fold

Folds describe functions that follow the recursive pattern:

``` haskell
f [] = v
f (x:xs) = x # f xs
```

### foldr

``` haskell
foldr :: (a -> b -> b) -> b -> [a] -> b
foldr f v [] = v
foldr f v (x:xs) = f x (foldr f v xs)
```

foldr is a right associative fold.

### foldl

foldl is a left assoiciated version of fold.

``` haskell
foldl :: (a -> b -> a) -> a -> [b] -> a
foldl f acc [] = acc
foldl f acc (x:xs) = foldl f (f acc x) xs
```

