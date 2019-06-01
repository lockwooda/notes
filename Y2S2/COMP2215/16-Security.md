# Security

Fine-grained privacy invasion
Attack through subverted devices
Attack on physical infrastructure

## IoT Security

Requires:

* Awareness of risks
* Legacy considerations
* Considerations about the product cycle
* Considerations about trade-offs for power consumptions

It is essentially internet security, but on a much more fine-grained scale.

## Microcontroller Security

Threads pose a big risk:

* Destruction of devices
* Influence of processes
* Denial of availiabilty
* Leakage of authorisation
* Leakage of sensor data
* Intellectual Property leaked
* Using the device as an attack vector

One needs to consider the resource limitations of your microcontroller, the power budget for the microcontroller, the availability and reliability of the microcontroller as well as the cost of manufacture.

We can:

* Incorporate security as part of the design
  * How do we react?
  * Do we add hardware?
  * Physical access?
  * Fuse settings?
* Minimise the configurability of the chip
  * Trade-off this with risk of dev. errors
  * No external RAM?
  * Hard-wire stuff on, use a ROM rather than a flash
    * If there is a security flaw, it cannot be fixed on ROM

You can also do the 'usual' stuff. Integrity checks, undefined inputs removed, debugging mode removed, logging and checking that reliability does not affect the security.

## Hardware Security

Hardware is attacked to extract firmware, support decryption or to infiltrate a device to turn it into an attack vector.

We can either passively attack by monitoring normal operation to infer implementation details, or actively attack by manipulating the hardware into abnormal states to gain insight into the design.

Viruses on the firmware on non-volatile storage cannot be removed, as it is not affected by an OS reinstall.

USB drives have microcontrollers which can be reprogrammed. USB drives self-declare what they are. You can make an attacking device pretend to be something it is not, to record screen shots, send keyboard commands, read network data, or be a hub and do all of those at the same time.

With an Internet of Everything, it makes everything at risk. Power, water, TV/radio, phone, production facilities and transportation is all at risk as a result.
There is also a military perspective on this.

