# Distributed Algorithms III: Leader Election

Centralised algorithms are simple, using a central server for mutex, as a sequencer for totally ordered multicasts and as a coordinator for distributed transactions. We need to choose a leader to undertake special tasks.
All processes must agree on a choice of leader.

We assume that there are N processes with totally ordered identifiers.
The process with the largest ID must win the election.
Messages eventually are delivered
Each process can only call one election
Multiple concurrent elections can be called by different processes
A participant is a process engaged in the election
Each participant has variable ``elected = false`` initially

## Correctness and Performance

We define correctness with:

* Safety
  * A participant process has ``elected = false`` or ``elected = P`` where ``P`` is a non-crashed process with the largest ID
* Liveness
  * All processes participate and eventually set ``elected != false`` or crash

We define performance in terms of:

* minimising total no. of messages sent
* minimising turnaround time

## Ring-Based Algorithm

Arranged into logical ring. Send messages around the ring.
Cannot have process failures (bad assumptions!)
Used in async system.

Initially every process non-participant.
Any process can call election.

- Mark self as part.
- Places its id in election msg.
- Send msg. to neighbour

On receiving election message:

* if ``id > myid``, forward, mark as part.
* if `id < myid`, replace id, fwd msg. mark as part.
* if part., stop forwarding

if `if = myid`, coordinator found, `elected = myid`, mark as non-part
On receiving elected message:

- if `id != myid`, `elected = id`, fwd msg., mark as non-part
- if `id = myid`, stop fwd.

Is safe (only process with largest id can start elected)
Is lively (every process eventually participates and receives msg.)

Best case: turnaround of `2N` messages
Worst case: turnaroud of `3N -1` messages
Does not tolerate any failures!

In modified version:

* Broken links detected by message sender, ring repaired
* Election message tracks IDs of all processes that fwd it
* Once message goes round circle, coordinator msg. sent out
* Once coordinator msg. reaches initiator
  * Election successful if coordinator appears in list
  * Otherwise new election

Messages are larger as a result, but have fewer messages. It now tolerates failures.