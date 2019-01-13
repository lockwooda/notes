# Trees in Haskell

Algebraic data types are useful in that we can specify shapes of tree very careful.

## Red Black Trees

Used as an efficient balanced tree implementation.
Each node carries an extra bit of info - its colour.

The root is black.
All leaves are black.
If a node is red, its children are black.
Every path from any node to a leaf contains the same number of black nodes.

``` haskell
data RBTree a = Leaf a | RedNode a (RBTree a) (RBTree a) | BlackNode a (RBTree a) (RBTree a)

blackH (Leaf _) = 0
blackH (RedNode _ l r) = maxlr
blackH (BlackNode _ l r) = 1 + maxlr
    where maxlr = max (blackH l) (blackH r)
```

## Functor

We could formulate the map function in a class of mappable types. This would give a consistent name for the map function.

The concept of a transformation of form 

```haskell
(a -> b) -> (f a -> f b)
```

for some function f on some type is called a Functor.

``` haskell
class Functor f where
    fmap :: (a -> b) -> f a -> f b

instance Functor Maybe where
    fmap _ Nothing = Nothing
    fmap g (Just x) = Just (g x)
```

