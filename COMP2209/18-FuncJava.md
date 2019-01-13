# Functional Programming in Java

Java is a typed language, we would expect to use typed functions similar to Haskell.

## Functional Interfaces

We define a functional interface in Java to be  an interface with a single abstract method.
Good practice would have you annotate the interface using @FunctionalInterface annotation.

## ActionListener as a Function

```java
JButton testButton = new JButton("Test button");
testButton.addActionListener(new ActionListener(){
    @Override
    public void actionPerformed(ActionEvent ae) {
        System.out.println("Boo!");
    }
});
```

Syntactically, this is very buggy and uses an anonymous inner class.
We can rewrite it into a much neater lambda expression.

``` java
JButton testButton = new JButton("Test button");
testButton.addActionListener(
    ae -> System.out.println("Boo!");
);
```

An argument list is a single variable name, or comma-separated list of variables names

``` java
(T1 x1, T2 x2, ..., Tn xn)
```

## Example

```java
public static void main(String[] args) {
    DDFrame ddf = new DDFrame("Digital Doilies");
    SwingUtilities.invokeLater(() -> ddf.init());
}
```

## java.util.function

This package defines common general purpose functional interfaces.

``` java
Function<T,R> -> R apply (T x)
BiFunction<T,U,R> -> R apply (T x, U y)
Predicate<T> -> boolean test (T x)
Consumer<T> -> void accept (T x)
Supplier<T> -> T get ()
UnaryOperator<T> -> T apply (T x)
BinaryOperator<T> -> T apply (T x, T y)
```

### Example

``` java
int absApply(Function<Integer, Integer> f, int x) {
    return f.apply(x < 0 ? -x : x);
}

Function<Integer, Integer> absSqrt = x -> Math.sqrt(x);
absApply(absSqrt, -25);
absAppl(x -> 6 -x, -4);
```

## Method References

Provides a means of referencing a given method as if it were a function in Java.

```java
int absApply(Function<Integer, Integer> f, int x) {
    return f.apply(x < 0 ? -x : x);
}

absApply(Math::sqrt, -25);
```

The operator :: in Java is an instruction to build a lambda expression for the given method.

```java
ClassName::staticMethod => (args) -> Class.staticMethod(args)
obj::method => (args) -> obj.method(args)
super::method => (args) -> super.method(args)
ClassName::new => (args) -> new Class(args)
ClassName::method => (obj, args) -> obj.method(args)
TypeName[]::new => n -> new TypeName[n]
```

