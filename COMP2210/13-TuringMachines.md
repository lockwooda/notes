# Computability and Turing Machines

Turing machines are as powerful as computer programs can be.

To give a Turing machine is an abstract way of giving an 'algorithm'. This is the Church-Turing thesis.

Turing machines can talk about themselves; Universal TM. It is a TM that talks about itself.

However we cannot accept all languages in a Turing machine.

## Turing Machines Description

Start in a start state $s \in Q$ at the leftmost position on the tape.
In each step, TM is in some state $q$ and at the tape position $\gamma$. Depending on $q$ and $\gamma$ it will:

1. Write a new symbol at current tape position
2. Move head left or right
3. Change state

TM accepts when it reaches special accept state $t\in Q$
Rejects when entering $r\in Q$

$M = (Q,\Sigma, \Gamma, \vdash, \sqcup, \delta, s, t, r)$
$Q$ is finite set of states
$\Sigma$ is the tape alphabet
$\Gamma$ is the tape alphabet ($\Sigma \subseteq \Gamma$)
$\sqcup \in \Gamma - \Sigma$ is the blank symbol
$\vdash \in \Gamma - \Sigma$ is the left endmarker
$\delta : (Q -\{t,r\})\times\Gamma\rightarrow Q\times \Gamma\times \{L,R\}$ is the transistion function
$s \in Q$ is the start state
$t\in Q$ is the accept state
$r\in Q$ is the reject state, $r \neq t$

$\delta(q, \gamma) = (q', \gamma ', X)$ means that when in state $q$ and seeing symbol $\gamma$, write the symbol $\gamma '$ on the tape, move the head in direction $X$ and enter state $q'$.
You cannot overwrite the left endmarker $\vdash$, cannot move to the left of the first symbol on the tape $\vdash$.

## Configurations

Information holding current state $q$, contents of the tape $y \in \Gamma^*$, position of head $x \in \mathbb{N}$ (where left endmarker is 0).
A triple $(q,y,n)$ is a configuration.
Initial configuration is $(s,\vdash x, 0)$ where $x\in \Sigma^*$ is the input.

## Semantics

For a string $y = y_0 ... y_k$ by convention we let $y_k = \sqcup$ for $n > k$.
Then for any $n\in \mathbb{N}$ let $\overline{y_n} = y_0 ... y_{n-1}$ and $\underline{y_n} = y_{n+1} ... y_{k}$.
We define transition as follows:

$(q, y, n) \overset{1}{\rightarrow}\begin{cases}(q',\overline{y_n}\gamma\underline{y_n}, n-1)&\text{if } \delta(q, y_n) = (q', \gamma, L)\\(q',\overline{y_n}\gamma\underline{y_n}, n+1)&\text{if } \delta(q, y_n) = (q', \gamma, R)\end{cases}$

For all configurations $\eta$ let $\eta \overset{0}{\rightarrow} \eta$, recursively let $\eta \overset{n+1}{\rightarrow} \mu$ where there exists $\theta$ sucht that $\eta \overset{n}{\rightarrow} \theta$ and $\theta \overset{1}{\rightarrow} \mu$.
These transitions are determinsitic.