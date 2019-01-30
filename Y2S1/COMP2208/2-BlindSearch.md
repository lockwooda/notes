# Blind Search

We formulate a goal, formulate the problem and then find a solution.

## Problem Types

* Single-state
  * Deterministic and fully observable
  * Agent knows exactly which state it will be in
  * Solution is sequence based
* Sensorless
  * Non-observable
  * Agent may have no idea where it is
* Contingency
  * Non-deterministic and/or partially observable
  * Perceptions provide new info
* Exploration
  * An unknown state space

## Problem Definition

Problem divided into four items.

* Initial state
* Actions/Successor Function
  * $S(x)$ = set of action-state pairs
  * $S($Arad$)$ = $\{<Arad \rightarrow Zerind, Zerind>,...\}$
* Goal Test
  * Explicit
    * Equality test
  * Implicit
    * Checkmate test
* Path Cost
  * e.g. sum of distances, number of actions executed, etc

A solution is a sequence of actions leading from the initial state to a goal state

## Tree Search

Offline, simulated exploration of state space by generating successors of already-explored states

![blindsearch1.png](Yes)

