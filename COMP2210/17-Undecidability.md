# Decidable and Undecidable Problems

Shown using diagonalisation that $HP$ is undecidable.

$MP \overset{def}{=} \{M\#x|x\in L(M)\}$ is undecidable. We could use diagonalisation to prove this but there is another way of doing the proof.

If $MP$ is decidable, there is a total TM $K$ for it.
Use $K$ to solve $HP$. Construct a new TM $N$.
$N$ on input $M\#x$:

1. Construct $M'$ that is like $M$ but with new accept state and transitions from old accept and rejects state to new accept state.
   Whenever $M$ accepts or rejects, $M'$ accepts.
2. Simulate $K$ on $M'\#x$; if $K$ accepts, accept. If $K$ rejects, reject

$M\#X\in L(N)\iff M'\#x \in L(K)\iff M \text{ halts on }x$
$N$ decides $HP$.
$MP$ decidable $\implies$ $HP$ decidable.
However, $HP$ is undecidable, so $MP$ is undecidable.

We have reduced $HP$ to $MP$. ($HP \leq MP$)