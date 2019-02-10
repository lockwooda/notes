# Task 1: Rotary Encoder

## Enabling Reading and Pull-ups

In order to enable reading of the input of the two directions of the rotary encoder, we change the data direction register E to have the bits PE4 and PE5 to zero. We do this through and-ing the original register with the compliment of the bit values of these two settings.

To enable pull-ups, we set the port E register in the positions PE4 and PE5. 