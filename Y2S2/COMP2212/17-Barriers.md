# Barriers, Latches, Performance, Scalability, CAS and Fine-grained Concurrency

Latches act as a gate. Until latch reaches terminal state, no thread passes.
When in terminal state, gate opened, all threads passed.

Barriers: all threads must come together at barrier point at same time in order to proceed.
Latches wait for events, barriers wait for other threads.

## Performance

Throughput, responsiveness
Avoid premature optimisations: correct, then make it fast!

Threading increases performance. Independent tasks run in parallel.
Introduces overheads (coordination, context switching, thread creation, scheduling overheads)

Scalability means ability to improve performance when additional resources added.

Some tasks naturally parallel: throw extra cores, improve performance.

## Amdahl's Law

$F$ is fraction of task that is sequential. $N$ is number of processor available.
$$
\text{speedup}\leq \frac{1}{F+\frac{1-F}{N}}
$$
Suppose half of task sequential. Maximum speedup is 2, regardless of no. of processors.

## Improving Scalability

Reduce lock contention: reduce duration locks are held
Reduce freq. with which locks are requested.
Replace exclusive locks with other coordination mechanisms. (e.g. fine-grained concurrency with CAS)

## CAS

Compare and Set

```
CAS(V, A, B)
```

V is a memory reference, A is the old value, B is the new value. If V contains A, then it is atomically changed to B and CAS returns true. If not, nothing happens and it returns false.

When multiple threads attempt to modify memory loc. with CAS, one wins, other loses.