# Names, Scope and Bindings

## Names

In order for programmers to be able to identify their variables. Therefore also known as identifiers.

They are an ad hoc design choice which can be case (in)sensitive, can have length and lexical rules and can clash with the reserved words and keywords of the language in question.

## Variables

Originated as fairly explicit references to location in memory. This was before type systems. Typically these days, they are placeholders for values of various types. For example, in function languages variables can store closures of arbitrary higher-type.

``` haskell
(Int -> Int) -> Int
```

Some languages let you obtain the memory location of where the variable contents are stored. The obvious example of this is C, with the operation & that takes variables to pointers. This is used a lot in C as it can be used to 'hack a lot of different things'. 

With this idea of memory locations, you can have *aliasing*, where two variables point to the same location in memory. This can lead to unexpected behaviour that is similar to buggy code with pointers, where one part of the code will modify a variable through a pointer which is used by another pointer leading to unexplained behaviour.

## Binding

A binding is an association between an entity and an attribute. There are various kinds of bindings within a programming language.
For example, within this lecture we will focus on two bindings, where you can have a binding between a variable and its type, or a variable an its scope.

The time when things are bound is important and differs from language to language. We will be focusing on the two key types of binding. The runtime system needs to know the type of a variable, as it needs to know how much memory to allocate to store values. This implies another binding between the variable and the data.

An important distinction for languages is when the binding for types occurs.

### Static Binding

Occurs before execution and remains unchanging during the execution of the program.

Static type binding is sometimes done through explicit type declarations, or through type inference. An example of a language that does static binding is Haskell, where compile errors are thrown for incorrect types.

#### Type Inference

A primitive take on type inference is to explicitly declare identifiers for each type. For instance, in Fortran, I, J, K, L, M and N are Integers and the rest are assumed to be the Real type. In Perl, \$p is a number or string, @p is an array, \$p is a hash 

A more sophisticated approach used in modern functional languages such as Haskell uses the compiler more. A compiler, using Hindley-Milner type inference, using the unification technique (which comes from formal logic), gives the most general type using polymorphism.

### Dynamic Binding

First occurs during the execution of the program (runtime) and can change throughout the runtime.

For dynamic type binding, a variable is bound to a type when an assignment is performed at runtime. The type of a variable can be changed during the execution of the program. This is most common in scripting languages such as Perl and JS.
Type checking is done at runtime, which can prove costly in both time and memory.

```
x = 3.5;
x = ["hello", "world!"];
```

If the above code is allowed in a language, time must be taken to reallocate the variable x another set of memory to accommodate the new variable size. This implies that this also takes up memory. 

### Differences Between Static and Dynamic Type Bindings

| Static                                                       | Dynamic                                                      |
| :----------------------------------------------------------- | :----------------------------------------------------------- |
| Type checking at compile time useful feature for programmers | Faster to write code that 'works'. Excellent for prototyping |
| Code faster as type checking and memory allocation costs avoided at runtime | Create ad hoc polymorphic functions. Can have two methods called the same thing but have different arguments (overloading in Java). |

## Kinds of Variables

* Static
  * Bound to a memory location at initialisation time
  * Class variables are static variables in the context of object-oriented code
* Stack
  * Memory allocated from runtime stack and bound when declaration executed
  * Statically typed
  * Deallocated when not in use
  * e.g. variable declared inside Java method. Used for local block based variables
* Explicit Heap
  * Bound with explicitly allocated memory
  * e.g. malloc in C, new in Java
* Implicit Heap
  * Dynamically assigned during assignment
  * Does not have memory explicitly defined for it
  * In languages with dynamic type binding

## Scope

The part of the code in which a variable can be referenced.

Local variables are declared within a block, the block is the scope of the variable

Global varaibles have global scope, unless they are hidden by a locally scoped variable with the same name.

Static (or lexical) scoping is where the scope of a variable can be determined at compile time.

### Dynamic Scope

Determined at runtime, scope depends upon the control flow of the program.
This exists in Perl. Someone thought this was a good idea, apparently.