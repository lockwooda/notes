# Evaluation Order and Laziness

Programs are expressions of a language, the value it produces is the evaluation of the expression under computation.

We think of computation as proceeding in steps. An individual step of evaluation is a reduction.

A key concept of evaluation is a reducible expression, known as a redex.
In Haskell, a redex is an expression comprising a function applied to an argument expression.

``` haskell
not (x==0) -- this is a redex as the function has not been applied to the expression
(sqrt . negate) 45 -- not a redex, as the left-hand side needs to be evaluated firstly

not (not True) -- contains two redexes, not True and not (not True)
(1 + 2) * (3 + 4) -- contains three, 1+, 3+ and (1 + 2) *
```

## Evaluation Strategy

Given many redexes in any given expression, which one do we reduce first?
The rules for this give an evaluation strategy.

For any expression we call a redex innermost if it contains no other redex. If it is not contained in any other redexes, it is outermost.

We also need to specify leftmost or rightmost when it comes to giving an evaluation strategy.

## Beta-Reduction

We can use lambda notation for functions, which looks like

``` haskell
\x -> e
```

where x is a variable that is bound in the expression e.

To reduce the redex

``` haskell
(\x -> e1) e2
```

We replace every occurance of x inside e1 with e2. This is called beta-reduction.
The expression mult 3 beta-reduces to (\y -> 3 * y).

### No Reduction under Lambda

Leftmost innermost reduction with no lambda reduction is call-by-value.
Leftmost outermost reduction with no lambda reduction is call-by-name.

C, C++, Java, Scheme, OCaml, Python, Javascript use call-by-value. Haskell uses call-by-name.

Haskell can avoid the problem of repeated evaluation through call-by-name and a technique known as graph reduction. The combination of call-by-name and graph reduction is known as lazy evaluation.

## Sieve of Eratosthenes

1. Write down the finite sequence 2, 3, 4, 5, ...
2. Mark the first number, p in the sequence as prime
3. Delete all multiples of p from the sequence
4. Repeat from step 2

``` haskell
sieve :: [Int] -> [Int]
sieve (p:xs) = p : sieve [ x | x <- xs, x `mod` p /= 0 ]
primes = sieve [2..]
```

## Strict Application

Sometimes you might want non-lazy, or strict, evauation.
Haskell has a special application operate ($!) that provides strict evaluation order.

It enforces that the argument is fully evaluated before being passed to the function.
square $! (1+2) evaluates 1+2 first to become square \$ 3.