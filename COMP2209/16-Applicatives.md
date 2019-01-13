# Applicatives

We introduced the concept of Functors a while back.
Not that fmap in the Functor class is limited in its type, it accepts only functions of type (a -> b)

Consider functions of type (a -> b -> c), functions of type (a -> b -> c -> d).
We can manage with a smarter scheme whereby we leverage curried function and just two operations to achieve a range of fmaps.

We use one function and an operation:

``` haskell
pure :: a -> f a
(<*>) :: f ( a -> b) -> a -> b
```

It takes function values that are structured in some context type and arguments to those values, also structured in that context type, and applies those functions to the arguments.
The resulting values are also therefored structured in that same context type.

## Pure

Pure simply takes a value for some type and embeds it in a larger structure.

``` haskell
-- for lists
pure x = [x]

-- for Tree
pure x = Leaf x

-- for Maybe
pure x = Just x

-- for IO
pure x = return x
```

## Applicative Function

```haskell
gs <*> xs = [ g x | g <- gs, x <- xs]
```

Given a list of functions (gs :: [a -> b]) and a list of arguments (xs :: [a]), for each function we apply it to each argument and return the whole lot as a list.

For example, fmap on lists can be defind in terms of pure and <*>.

``` haskell
fmap g xs = pure g <*> xs
[g] <*> xs = [g  x | g <- [g], x <- xs]
```

We can define an add operation on lists of integers.

```haskell
add :: [Int] -> [Int] -> [Int]
add xs ys = pure (+) <*> xs <*> ys
```

To define mg <*> mx, on thype IO we can think:

1. There may be IO while evaluating mg to a pure function
2. There may be IO while evaluating mx to a pure value
3. We can return the pure value mg applied to mx

``` haskell
(<*>) :: IO (a -> b) -> IO a-> IO b
mg <*> mx = do g <- mg
               x <- mx
               return (g x)
```

## Applicative Style

Given any expression that is built with pure and <*>.