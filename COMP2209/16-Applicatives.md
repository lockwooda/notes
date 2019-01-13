# Applicatives

We introduced the concept of Functors a while back.
Not that fmap in the Functor class is limited in its type, it accepts only functions of type (a -> b)

Consider functions of type (a -> b -> c), functions of type (a -> b -> c -> d).
We can manage with a smarter scheme whereby we leverage curried function and just two operations to achieve a range of fmaps.

We use one function and an operation:

``` haskell
pure :: a -> f a
(<*>) :: f ( a -> b) -> a -> b

gs <*> xs = [ g x | g <- gs, x <- xs]
```

Given a list of functions (gs :: [a -> b]) and a list of arguments (xs :: [a]), for each function we apply it to each argument and return the whole lot as a list.

It takes function values that are structured in some context type and arguments to those values, also structured in that context type, and applies those functions to the arguments.
The resulting values are also therefored structured in that same context type.