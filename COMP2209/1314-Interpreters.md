# Interpreters

## Substitution

The grammar of the lambda calculus is as follows:

``` haskell
E :: = x | \x -> E | E E
```

x is drawn from the set of variables, and the lambda terms are called abstractions.
The lambda calculus is Turing complete, as it can encode arithmetic, logic etc.

We say that a variable x is bound in the term (\x -> e) and that the scope of this binding is the term expression e. 

### Beta-Reduction Redux

To reduce the redex (\x -> e1) e2 we must replace every free occurrence of x inside e1 with e2.
We write the beta-reduction rule using a substitution operator and we'll write reduces to relation as an arrow.

(\x -> e1) e2 |-> e1 [ x := e2 ]

When substituing we need to distinguish between free and bound variables, and also if the substituted variable is the same as the next bound variable.

### Alpha-Conversion

Considering (\y -> x) [x := y], if replace \y with \z we can then substitute in y to x. Renaming a bound name throughout a term is known as alpha-conversion.
Any lambda-term \x -> e is alpha convertible to \y -> e [x := y] where this is defined.

``` haskell
subst :: Expr -> String -> Expr -> Expr
subst (Var x) y e
    | x == y = e
    | x /= y = Var
subst (Lam x e1) y e
    | x /= y && not (free x e) = Lam x (subst e1 y e)
    | x /= y && (free x e) = let x' = rename x in subst (Lam x' (subst e1 x (Var x'))) y e
    | x == y = Lam x e1
subst (App e1 e2) y e = App (subst e1 y e) (subst e2 y e)

free :: String -> Expr -> Bool
free x (Var y) = x == y
free x (Lam y e)
    | x == y = False
    | x /= y = free x e
free x (App e1 e2) = (free x e1) || (free x e2)
```

## CEK Machines

Using the above subst code is a horrible way of doing beta-reduction.
We could keep a record of substitutions that we need to make and look them up in the list.

That is the concept of an environment. It records bindings of variables to expressions. A partial function from variable names to expressions.

We write e | E to represent an expression e in the environment E.
We have (\x -> e1) e2 | E |-> e1 | E [ x := e2 ]
E [ X := e ] means environ E updated with new binding of x to expression e

Consider the case (\x -> e1) e2 where the function is evaluated. In this case, the focus likes on e2 and the rest of the expression is (\x -> e1) [-], where [-] is a hole into which we can plug an expression.
If we consider e1 e2, where e1 is not a function, then the focus lies on e1 and the rest of the function is [-] e2.

We can introduce terms that represent the rest of the program.
The grammar for this is:

``` haskell
V ::= (\x -> e)
F ::= V [-] | [-] e
```

These terms are frames.
As we evaluate, we identify a number of frames by focussing on smaller and smaller subtrees until the next redex is found.
A stack of frames is what we call a continuation.
Think of it as a call stack in Java, where the control returns to when the current expression terminates.

We write our reductions as follows:

```haskell
e | E | K ⟼ e' | E' | K'
```

We see that we need to push a frame when we have an unevaluated expr in function position

```haskell
e1 e2 | E | K ⟼ e1 | E | ([-] e2) :: K
```

If the focused expression is terminated, we write V for this, then there are three possible outcomes for the stack.

### K is empty

The evaluation has terminated

### K has [-] e at the top

If we are using call-by-value, we must focus on e and push a replacement frame

```haskell
V | E | [-] e :: K ⟼ e | E | V [-] :: K
```

### K has (\x -> e) [-] at the top

We perform the beta reduction.

``` haskell
V | E | (\x -> e) [-] :: K ⟼ e | E [x := V] | K
```

