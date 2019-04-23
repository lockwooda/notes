# Message Passing and Software Transactional Memory

Forget about critical regions, all communication is explicit: processes send each other messages.
Easier: fewer risks of deadlock, races, visibility, etc.
General: Distributed systems do not have a shared memory.
There is increasing hardware support for message passing in multi-core hardware

Can be either synchronous or asynchronous.

## Erlang

Designed for distributed, fault-tolerant applications.
Uses asynchronous message passing. A functional core, with call-by-value and garbage collection.

### Actor Model (Asynchronous Message Passing)

Each process is an actor. Each actor has an adresses, a message queue (FIFO).
Actors send messages to other addresses where they are queued on message queue till processed.

Nodes have names, addressed incorporate nodes as well as registered names.

## Software Transactional Memory (STM)

Inspired by databases. Optimistic concurrency:

* During transaction, all changes made
* There is a commit
  * If successful, changes validated
  * If not, rollback
* All or nothing

Change from a lock to something like:

```
void deposit(account, amount) {
    atomic {
        int t = bank.get(account);
        t = t + amount;
        bank.put(account, t);
    }
}
```

### Multiversion Concurrency Control

Everyone sees snapshot of database at any given moment.
Old versions of data not immediately destroyed, relies on persistent data.

All closure data structures are persistent. Copying kept to minimum.
e.g. persistent hashmap

## Clojure

Functional, dynamically typed, designed for concurrency, metadata for all types.

Concurrency in this language is: if data cannot be altered, life is simple. No races.
References change, the data does not!

All changes are atomic and isolated. Every change to Ref is made or none. No one sees other changes within transaction.

For STM, surround code with (dosync). It uses Multiversion Concurrency Control (MVCC), a snapshot system where readers may see old state of world. Readers never block writers, writers never block readers.

Agents: Refs are coordinated, with synchronous changes to multiple locations.
Agents attached to single loc. for lifetime and perform changes asynchronously.
Function sent to agent, action executed asynchronously by a thread pool.