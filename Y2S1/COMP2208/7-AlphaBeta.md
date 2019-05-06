# Alpha-beta Pruning

Alpha-beta pruning performs DFS but allows us to disregard certain branches of tree

Alpha represents the lower bound on node value

* The worst that we can do
* Associated with MAX nodes

Beta represents the upper bound on node value

* The best that we can do
* Associated with MIN nodes

If best we can do on current branch is $\leq$ the worst we can do, no point to continue branch.

```
function MAX-VALUE(state, a, b, depth)
	if (depth==0) then return EVAL(state)

	for each s in SUCCESSORS(state) do
		a = MAX(a, MIN-VALUE(s, a, b, depth-1)
		if a ³ b then return a
	end

	return a
```

```
function MIN-VALUE(state, a, b, depth)
	if (depth==0) then return EVAL(state)
	
	for each s in SUCCESSORS(state) do
		b = MIN(b, MAX-VALUE(s, a, b, depth-1))
		if b £ a then return b
	end
	
	return b
```

Alpha-beta pruning removes different subtrees based upon which direction the tree is traversed

Ordering of subtrees has large effect on amount of pruning

## Properties

Guaranteed to give the same values as Minimax

If the tree is ordered (best moves first), complexity of $O(b^{\frac{d}{2}})$

Perfect ordering not possible