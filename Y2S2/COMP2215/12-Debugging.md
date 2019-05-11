# Debugging Embedded Systems

Many errors can occur with embedded systems:

*  Compile-time errors
  * Syntax or semantic erros
* Run-time errors

Typical run-time errors are:

* Errors of intent `if(i=i); {}`
* Boundary violations
  * Overflows
  * Wrong pointer (uninitialized)
* Unanticipated program flow
* Incomplete state preservation
  * Non-reentrant calls from ISR

Debugging is hard with:

* Newer hardware
* Cause and effect distant in space and/or time
  * Impact happens several million instructions later
  * Symptoms give no hint to root cause
* Programmer has the wrong model
  * Misinterpreted macro expansion
  * Code optimization leads to very different code than what programmer uses for reasoning
  * Wrong assumption about architecture
* Environmental effects
* Instrumentation alters scene
  * Bug does not appear in debugger
  * Tools impractical
* Stealth bugs
  * Evidence removed by the bug
* Concurrent, event-driven, real-time
  * Timing related, rare bug
  * Start/stop debugging not suitable
  * Often multiple microcontrollers acting in a system

## Strategy

* Gather data
  * Find how to make it reproducible
  * Record symptoms
* Isolate
  * Binary and heuristic search
* Confirm assumptions
* Controlled experiments

### Access

Software instrumentation: difficult because of constraints
Hardware instrumentation: Easier in embedded systems, free pins rare
Re-purpose pins
Use existing LEDs: slow patterns for humans, fast flicker for communication

### Make Bug Reproducible

What is the fault condition?

What discriminates it from normal operation?

* Use as trigger for data gathering
* Use as stop for trace ring-buffer

Debugging should be designed into a system.
Make targeted minimal changes.
Keep a good record of change and effect:

* Versioning systems
* Log book

Construct hypotheses on why the bug occurs.

There are many different tools that can be used:

* Simulators
* In-circuit emulators
* JTAG/BDM debuggers
* Digital oscilloscopes
  * With DAC
* Logic analysers

## Typical Scenarios

Device dead:

* Watchdog?
* Undefined interrupt vectors?
* Error in initialisation?

Periodic failure:

* Boundary violation?
* Memory problem?

Random failure:

* Memory problem?
* Timing problem?
* Atomicity violation?

### Memory Problems

Leaks:

* Program allocates small amounts of memory, never frees it
* System runs out of memory over time

Fragmentation:

* malloc serves consecutive memory
* free calls merge accent blocks

Corruption:

* Dangling pointer
* Stack touches heap
* Array index exceeds boundary
* Outdated preserved state
  * e.g. struct still holds pointer to memory that was freed

Debugging:

* Use valgrind's memory tools
  * On a microcontroller, not enough RAM for fancy tools
* malloc can be interfaced with
  * http://andybrown.me.uk/2011/01/01/debugging-avr-dynamic-memory-allocation/

Compiler supports debugging:

* Create assertions
  * `#define assert(p) if (p) else ( ACTION )`
* Predefined labels
  * `__FILE__`, `__LINE__`
* Pre-processor conditional compilation