# Type Safety

Need to define 'wrong' in 'well-typed programs never go wrong'.

In small step semantics, can model run time errors as 'stuck' terms.
For big step semantics, explicitly model between stuck and divergent terms using error relation.
Can distinguish between stuck and divergent term. Doesn't allow to state type safety for big step. Only considers complete computations. Can only refer to weak notion of type correctness: preservation.

## Preservation

A typed language satisfies (weak) preservation if the following holds:
$$
\forall \text{ closed well-typed terms }E:
\\ \text{if } \vdash E:T \text{ and } E \Downarrow V \text{ then } \vdash V:T
$$
Programs do not change type after run time. Values that programs produce are of expected type.

A typed language satisfies preservation if the following holds:
$$
\forall \text{ closed well-typed terms }E:
\\ \text{if } \vdash E:T \text{ and } E \rightarrow E' \text{ then } \vdash E':T
$$
At every step of evaluation, programs do not change type.

## Progress

Preservation does not capture fact that well-typed terms stay in semantically 'good' states.
To capture type safety more fully, need to know well-typed terms never become stuck.

A typed language satisfies progress is the following holds:
$$
\forall \text{ closed well-typed terms }E:
\\ \text{if } \vdash E:T \text{ then either } E \rightarrow E' (\text{  for some }E') \text{ or } E \text{ is a value }V
$$
Type safety is the combination of preservation and progress.

To prove progress, we use a proof by induction over the type derivation $\vdash E : T$

### Base Cases

If the proof tree consist of just the rule TInt or TBool then $E$ is a value.

### Inductive Cases

Given last rule to derive type of $E$ is TIf. We know $E$ of form:

``` 
if E1 then E2 else E3
```

where $\vdash E_1 : \text{Bool}$, $\vdash E_2,E_3 : T$. If $E_1$ not a value, then by inductive hypothesis, must have $E_1 \rightarrow E_1'$ for some $E_1'$. Allows us to derive:

```
if E1 then E2 else E3 -> if E1' then E2 else E3
```

If E1 is a value. We know that only values of type Bool are true and false. In either case, we get reduction

```
if E1 then E2 else E3 -> E2
if E1 then E2 else E3 -> E3
```

We have a reduction, therefore progress.