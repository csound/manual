<!--
id:guiro
category:Signal Generators:Models and Emulations
-->
# guiro
Semi-physical model of a guiro sound.

It is one of the PhISEM percussion opcodes. PhISEM (Physically Informed Stochastic Event Modeling) is an algorithmic approach for simulating collisions of multiple independent sound producing objects.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = guiro(kamp, idettack [, inum] [, idamp] [, imaxshake] [, ifreq] [, ifreq1])
    ```

=== "Classic"
    ``` csound-orc
    ares guiro kamp, idettack [, inum] [, idamp] [, imaxshake] [, ifreq] [, ifreq1]
    ```

### Initialization

_idettack_ -- period of time over which all sound is stopped

_inum_ (optional) -- The number of beads, teeth, bells, timbrels, etc.  If zero, the default value is 128.

_idamp_ (optional) -- the damping factor of the instrument. _Not used._

_imaxshake_ (optional, default=0) -- amount of energy to add back into the system. The value should be in range 0 to 1.

_ifreq_ (optional) -- the main resonant frequency. The default value is 2500 Hz.

_ifreq1_ (optional) -- the first resonant frequency. Default value here is 4000 Hz

### Performance

_kamp_ -- Amplitude of output.  Note: As these instruments are stochastic, this is only an approximation.

## Examples

Here is an example of the guiro opcode. It uses the file [guiro.csd](../examples/guiro.csd).

``` csound-orc title="Example of the guiro opcode." linenums="1"
--8<-- "examples/guiro.csd"
```

## See Also

[Models and Emulations](../siggen/models.md)

## Credits

Author: Perry Cook, part of the PhISEM (Physically Informed Stochastic Event Modeling)<br>
Adapted by John ffitch<br>
University of Bath, Codemist Ltd.<br>
Bath, UK<br>

New in Csound version 4.07

Added notes by Rasmus Ekman on May 2002.
