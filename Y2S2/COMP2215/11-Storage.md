# Persistent Storage

EEPROM controlled by data bus.
Flash controlled by program bus.
SD Card controlled by SPI.

## EEPROM

Electrically Erasable Programmable Read-Only Memory

* Single memory cells can be written
* Slow access
  * Parameter based storage
  * Code tracing
* Limited number of write cycles available

Uses CMOS floating gate transistors. Programming requires 20V, which stresses the transistors.

Programming speed has been traded for endurance.

* High internal voltage
  * Increases fast programming, decreases endurance
* High voltage ramp rate
  * Increase fast programming, decreases endurance
* Oxide thickness
  * Decreases fast programming, increases endurance

Number of cycles per day on a low-maintenance device will be very very low.

On AT90USB1286, has 4KB size. Has just over 100k erase/write cycles for each byte.
We use brown-out detection to avoid corruption.

The EEPROM can be destroyed quickly with an 8 MHz clock like the one on the chip.

## Flash Memory

Most common non-volatile storage for embedded systems.
Still relatively inexpensive, usually do not have large amounts of memory.

Compact and robust against vibration, magnetic fields and dust.

Has very limited number of writes:

* MLC flash: approx. 5000 program/erase cycles per 2-bit cell
* TLC flash: < 1000 program/erase cycles

Have to trade off between production cost, capacity and lifetime.
There is read access to individual cells, but write requires an erase cycle.
Erase is possible for blocks and sectors.

Sector erase allows pre-erasing of several blocks.

## File System and SD Cards

On SD cards, about 1% of capacity is reserved for DRM.
Wear levelling is required to extend the lifetime of the card.

The FAT file system logically maps addresses to physical address on the SD card.

There are three interface methods available for the SD card:

* 1-bit SD bus
* 4-bit SD bus
* SPI

### Serial Communication

Point-to-point communication over a bus, using either master/slave or multi-master (which requires dealing with collisions).

Serial communication can be:

* Simplex
  * One-direction only
* Half-duplex
  * Bi-directional, alternating
* Full-duplex
  * Bi-directional at the same time

SPI (Serial-Peripheral Interface) is full-duplex, with hardware addressing at 10 MHz.
An SD card uses SPI with write protection and card detection to read and write from.

It reads in single block modus.