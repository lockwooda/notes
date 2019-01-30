# Types and Classes

## Types

Types are a name for a collection of related values.
They form part of the error checking in the language, as Haskell is *strongly statically typed*. This means that types are checked at compile time and compile will throw an error if it finds problems with types.

### Basic Types

The basic types are Bool, Char, String, Int, Integer and Float.
*Compound types* are formed from basic types by combining them with type operators.

### Compound Types

#### Lists

For any valid Haskell type T, we can form the Haskell type [T], which is a list of values of type T. Lists must contain value of the same type.

#### Tuples

Tuple is a sequence of values of possibly different types.
$(T_1, T_2, ...,T_n)$ is the type of n-tuples where values of this type are of the form $(v_1, v_2, ..., v_n)$ each $v_i$ has type $T_i$.

#### Functions

Given any Haskell type T and U, we can form the function type T $\rightarrow$ U.
They are a function that take a value of type T and return a value of type U.
T and U can be any type.

#### Curried Functions

Using the fact that functions can have any type, we can create a function that returns functions.

```haskell
add' :: Int -> (Int -> Int)
add' x y = x + y
```

#### Polymorphic Functions

If we have functions of type

```haskell
[Bool] -> Int
[Int] -> Int
[[Char]] -> Int
```

then we can use type variables to stand for any type to create

```haskell
[a] -> Int
```

We say that a function is polymorphic if its type contains one or more type variables.

## Basic Type Classes

Type classes are Haskell's way of provoding overloaded operations. Think of them like interfaces in Java, anything that implements it must support the operations it defines.