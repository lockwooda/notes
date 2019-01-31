# Computational Complexity

Computation complexity is concerned with:

* Measuring how the time/space required by an algorith/problem increases as the *input gets larger*
* Classfiying these problems according to their complexity
  * Identify computational problems with no efficient algorithm that exists
  * Identify problems with no *known* efficient algorithm
    * There *may* exist a solution that we do not know of

A problem is a computational problem with a set of inputs and corresponding outputs
An algorithm is a procedure to solve that problem
A problem instance is a particular possible input to a given problem

## Complexity

Complextiy is a measure of how much an algorithm costs, as a function of instance size.
The *worst case* complexity, $W_A$, of an algorithm $A$ is defined:
$ W_A(n) =\text{max}\{\text{cost}(I)\text{ } |\text{ } I \text{ is a problem instance and }\text{size}(I)=n \}$
Average cost complexity exists, with the average of cost for all $I$ of size $n$.

### Time Complexity of Turing Machine

The *worst case* time complexity of a Turing machine $M$ is the function $f: \mathbb{N}\rightarrow \mathbb{N}$ where for $n\in \mathbb{N}$, $f(n) = $ the maximum number of steps $M$ uses on an input of length $n$.

### Space Complexity of Turing Machine

The *worst case* space complexity of a Turing machine $M$ is the function $f: \mathbb{N}\rightarrow \mathbb{N}$ where for $n\in \mathbb{N}$, $f(n) = $ the maximum number of tape cells $M$ uses on an input of length $n$.

### Big-$\Theta$ Notation

We say $f(n)$ is $\Theta(g(n))$ for some $g(n)$ if there exists reals, $c >0$, $d>0$, integer $M> 0$ with $d g(n)\leq f(n) \leq cg(n)$ for all $n \geq M$.
We say $f(n)$ and $g(n)$ have the same growth rate.

### Big-O Notation

We say $f(n)$ is $O(g(n))$ for some $g(n)$ if there exists reals, $c >0$, integer $M> 0$ with $f(n) \leq cg(n)$ for all $n > M$.
We say that $g(n)$ is an asymptotic upper bound for $f(n)$.

