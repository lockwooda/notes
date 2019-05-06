# Graphs in Haskell

Three approaches to graphs:

* Using indexed collections of Nodes, Edges
* Using a structured data type with cyclic dependencies
* Inductive approach using graph constructors

## Indexed Collections

Haskell has a stable Data.Graph package that dates from twenty years ago.

``` has
type Table a = Array Vertex a
type Graph = Table [ Vertex ]
```

A graph is a vertex-indexed array of lists of vertex values.

Cannot change the structure of them, don't allow for weighted graphs, performance slow compared to C, not structural so all algorithms are traversals across arrays.

## Cyclic Dependencies

Consider a loopy list

```java
class List {
    int head;
    List tail;
}

List repeat(int x) {
    List xs = new List();
    xs.head = x;
    xs.tail = xs;
    return xs;
}
```

In Haskell...

```haskell
repeat x =
    let xs = x : xs in xs
```

The value xs is defined in terms of itself. Lazy evaluation allows us to get away with this. Using mutual recursion to define cyclic values lazily is known as tying the knot.

``` haskell
data Graph a = GNode a (Graph a)

mkGraph :: [(a, Int)] -> Graph a
mkGraph table = table' !! 0
    where table' = map (\(x,n) -> GNode x (table' !! n)) table
```

No explicit naming of nodes need. Fast traversal, just follow the next link. However you cannot 'escape' from the structure quickly and cannot build incrementally.

## Inductive Graphs

We can use FGL - the Functional Graph Library. Data.Graph.Inductive.Graph.

Provides an inductive way of building graphs.
Nodes in the graph are represented by Int values.