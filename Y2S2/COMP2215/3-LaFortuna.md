# La Fortuna Hardware

## Microcontroller

Low power consumption. Good for running on battery for a long time. They have very low sleep power and can power back up very quickly.
Cross-compilation is relatively simple. Flash and RAM typically in the kilobytes of memory.

## System-on-Chip

Typically uses ARM core CPUs, specific to the manufacture's preferences. May include audio ADC/DAC, and other specific modules for what is needed.

Flash and RAM is in the megabyte range instead of the kilobyte range.

The cross-compilation setup is complex though, so cloud-based cross-compilation is more popular with system-on-chip.

## Embedded Computer

Convenient development with login console. It is capable enough to run a familiar OS such as Linux. System boot time though makes frequent sleeping inefficient.
Interrupts are complex, making I/O timings more difficult.

They are often combined with microcontrollers for better I/O control, in comparison to purely embedded.

## La Fortuna Chip

It is a microcontroller. A computer on a single chip.
It has low power compared to system-on-chip. It has easy low level usage and is programmable over USB. 