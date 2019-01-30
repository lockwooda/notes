# Rice's Theorem

Every non-trivial property of recursively enumerable (RE) sets are undecidable.
A prorperty of RE sets is a map:
$P: \{\text{RE subsets of } \Sigma^*\} \rightarrow \{t, f\}$

For any RE set $X \subseteq \Sigma^*$, either $P(X) = t$ or $P(X) = f$.
A property is non-triviai when it is not universally $t$ or $f$.

If we identify a property $P$ with a subset $P \subseteq \{\text{RE subsets of } \Sigma^*\}$, Rice's theorem states that any $P$ with $P \neq \emptyset$ and $P \neq \{\text{RE subsets of }\Sigma^*\}$ is not recursive.

## Examples

Remember, a RE set is described using a TM that accepts it.

$\{M\text{ } |\text{ } L(M) = \emptyset\}$
$\{M\text{ }|\text{ } \epsilon \in L(M)\}$
$\{M\text{ }|\text{ } L(M) \text{ is finite}\}$
$\{M\text{ }|\text{ } L(M) \text{ is regular}\}$
$\{M\text{ }|\text{ } L(M) \text{ is context-free}\}$
$\{M\text{ }|\text{ } L(M) = \Sigma^*\}$

