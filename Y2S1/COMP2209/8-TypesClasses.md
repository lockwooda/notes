# Types and Classes

String is a type synonym for [Char]. It provides better documentation for the type of a function.

Haskell lets you define your own.

``` haskell
type Pos = (Int, Int)
```

Nested type synonyms are allowed, but recursive type synonyms are not.

Suppose we had the following type and we want to distinguish between Int and a Foo type. We use a constructor.

``` haskell
type Fpp = Int
```

## Constructor

A constructor is a name tag that identifies the values in a type.
We can use data instead of type to define a new type.

``` haskell
data Foo = F Int
F 5 :: Foo
```

We can use data to create entirely new finite types, where the values are explicitly listed.

``` haskell
data Day = Mon | Tue | Wed | Thu | Fri | Sat | Sun
```

Constructors in a new type may take multiple parameters.

``` haskell
data Shape = Circle Float | Rect Float Float
```

For types with a single unary constructor, we use the keyword newtype instead.

## Classes

``` haskell
class CONSTRAINTS => NAME a where
    function :: type
    function :: type
    ...
    function = default definition
    function = default definition
```

```haskell
class Eq a => Ord a where
    (<),(<=),(>),(>=) :: a -> a -> Bool
    min, max :: a -> a -> Bool
    
    min x y
        | x <= y = x
        | otherwise = y
        
    max x y
        | x <= y = y
        | otherwise = x
```

### Defining instances

``` haskell
instance Ord Bool where
    False < True = True
    _ < _ = False
    b <= c = (b < c) || (b == c)
    b > c = c < b
    b >= c = c <= b
```

``` haskell
instance Tree LTree where
    flatten (Leaf a) = [a]
    flatten (Node l r) = flatten l ++ flatten r

instance Tree ITree where
    flateen (Leaf) = []
    flatten (Node l y r) = flatten l ++ [y] ++ flatten r
    
instance Tree MTree where
    flatten (Node a cs) = a : map flatten cs
```

We can derive instances.

``` haskell
data Day = Mon | Tue | Wed | Thu | Fri | Sat | Sun deriving (Eq, Ord, Show, Read)
```

