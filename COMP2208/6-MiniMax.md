# Minimax Search

Using adversarial games, as opposed to unopposed search problems.
Therefore must take into account the opponent

We can construct a tree representing all the states of the game

## Game Tree and Minimax

*Initial state*: Initial board state
*Goal state*: Winning positions
*Actions*: Legal move
*Expand function*: Generate legal moves
*Eval function*: Assign scores to each board state
*Game tree*: All possible games

Minimax is a view of search in adversial games.
MAX is traditionally the player, picks moves whose heuristic is the best (max)
MIN is the opponent, wants to pick moves to minimise player's advantage

Search to given ply (depth-limited)
Evaluate heuristic for leaf nodes
Internal nodes propagate heuristic values towards root

* MAX takes max of their children
* MIN takes min of their children

### Minimax Properties

* Is complete if tree is finite
* Time: $O(b^m)$
* Space: $O(bm)$
* Is optimal against optimal opponent

## Evaluation Functions

Typically linear function in which coefficients ae used to weight game features

Unlikely to be perfect. Games with uncertainty add notions of expectation.

## Horizon Effect

Cannot exhaustively search most game trees
Significant events may exist just beyond the part of tree searched

The further we look ahead, better our evaluation of position.

## Quiescent Search

Bad evaluation function leads to wild swings in behaviour.
We can look for stable positions.
We can expand nodes in nonquiescent positions to deeper ply until stable situation is reached.

## Branching Factor

Branching factor of a game is number of actions which can be chosen

Many games do not have a low branching factor:

* Chess has a factor of 36
* Go has a factor of 200 (!!!)

Minimax is **not** efficient.

