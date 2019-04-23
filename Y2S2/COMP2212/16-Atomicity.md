# Atomicity, Locks and Monitors

Heap operations may not take effect immediate - may be on local cache for some time.

Operations done on one thread may not be visible on anothe thread. Modern languages have constructs that reference visibility (e.g. volatile in Java)

Modern compilers reorder instructions, that may introduct concurrency bugs.
A memory model is a formal description of how shared memory concurrency works
A contract between the programmer and compiler designer. Compiler designer wants maximum flexibility for optimisations, the programmer wants to avoid the compiler introducing bugs.

An operation is *atomic* if it is indivisible. It either happens fully or not at all. Cannot be partially done.

Using atomic data-structures not a catch-all because atomicity might be at the wrong level of  granularity.

A lock is a classic programming abstraction for concurrency. May use hardware guarantees, or OS functionality for implementation. Low-level abstraction that is difficult to get right. Locks can lead to deadlocks.

Monitors combine the concept of a lock with conditional variables - queues of threads that are waiting on a lock
wait(&lock) - release lock, go to sleep
signal() - wakeup single waiting thread
broadcast() - wakeup all waiting threads