# Reliability

Typical environment for embedded systems has:

* Thermal risks
* Electromagnetic risks
* Electrostatic risks
* Radiation (high altitudes, nuclear power plants)
* Mechanical risks (shock, vibration)
* Adversarial attack risks

Critical system failure can result in:

* Loss of life
* Loss of vehicles
* Irreversible damage

Liability for failure of embedded systems cannot be dodged by excluding it from the liability license.

Common issues on hardware:

* Glitches
  * Power
  * Clock
  * Signals
* Wear-out
  * Flash
  * EEPROM

Common issues on software:

* Timing
  * Real time
  * Race conditions with multiple threads
* Difficult code
  * Parallelism
  * Optimisation

## What Can Happen and What Can Be Done?

Erroneous signal could be detected through interrupts. The wrong instruction could be executed. The state of memory could change temporarily or permanently. The CPU state could change or reset!

We need to reduce the probability that something bad happens. Do not underestimate the failure probabilities for a mass market product that is on 24/7.

Consider:

* Physical protection
* Targeting application specific failure modes
  * Ubiquitous use in embedded systems
  * Has diverse requirements including cost
  * e.g. Power glitches have different effects depending on their timing relative to the clock
  * Engine controller -> Probability may be acceptably low
  * ATM -> Hit in vulnerable period very likely (intentional attack)
  * Can respond by shutting down, trying to recover
* Redundacy
* Protection circuits
  * Recognise adverse situations
  * Recognise failures
    * Watchdog (timing integrity)
    * Hardware checksums (data integrity)
  * Fallback systems
    * Recognise large deviations of refined system
    * Use as second chance if refined system fails
* Defensive programming
  * Self-stabilising protocols
  * Initialise unused resources
  * Coding rules
  * Automated tools for compliance and model checking

If the failed system cannot be identified, using the simplest system. Vote for which one has failed.