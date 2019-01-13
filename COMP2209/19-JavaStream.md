# Iteration and Java Streams

Java is missing lists. Java provides excellent support for Collections of data; ArrayLists, HashSets, Stacks, etc.
Part of this support is Iterator objexts for these Collection data structures.

```java
Iterator it = shapes.getIterator();
while (it.hasNext()) {
    Shape s = it.next();
    s.setColor(Color.RED);
}
```

This is external iteration. We want internal iteration.

## Internal Iteration

The client calls a generalised forEach method and the library does the actual iteration.

```java
shapes.forEach(s -> {s.setColor(RED)})
```

Internal iteration is provided in the form of Streams.

## Streams in Java

Streams are list like in Java that work smoothly with the functional programming features.
Streams are immutable lists of data that support a number of useful stream operators.

Streams support lazy and eager implementation of list processing functions:

* Lazy: stream values calculated as required as one iterates
* Eager: stream values of output are calculated as required at point the stream function is called

Streams are Java's version of Haskell's lazy lists.

Two natural types of stream operations:

* Intermediate Stream Operations
  * Natural implemented as lazy operations
  * Return another stream
  * Can be composed with other intermediation operations
  * Map, Filter
* Terminal Stream Operations
  * Naturally implemented as eager operations
  * Consumes input stream to produce a side-effect or return value
  * forEach, findFirst, iterator

## Working with Stream

To create Stream, best to convert existing Collection object. Class Collection has method stream() that returns Stream containing all elements.

```java
Stream<R> map(Function<T,R> f)
```

Takes a function and applies function to every element in the stream to produce new transformed stream.

```java
Stream.of(1,2,3,4).map(num -> num * num).forEach(System.out::println);
```

Suppose we have a class Person with a bunch of data including a set of jobs that they have done. Assume accessor method for this, getJobs().

```java
ps.stream()
    .map(x -> x.getJobs())
    .flatMap(x -> x.stream())
    .distinct()
    .collect(Collectors.toList());
```

Streams in Java are stateful. Once operated on Stream object it remembers that it has been operated on and will not allow further operations.