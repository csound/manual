<!--
id:tambourine
category:Signal Generators:Models and Emulations
-->
# tambourine
Semi-physical model of a tambourine sound.

It is one of the PhISEM percussion opcodes. PhISEM (Physically Informed Stochastic Event Modeling) is an algorithmic approach for simulating collisions of multiple independent sound producing objects.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = tambourine(kamp, idettack [, inum] [, idamp] [, imaxshake] [, ifreq] \
                      [, ifreq1] [, ifreq2])
    ```

=== "Classic"
    ``` csound-orc
    ares tambourine kamp, idettack [, inum] [, idamp] [, imaxshake] [, ifreq] \
                    [, ifreq1] [, ifreq2]
    ```

### Initialization

_idettack_ -- period of time over which all sound is stopped

_inum_ (optional) -- The number of beads, teeth, bells, timbrels, etc.  If zero, the default value is 32.

_idamp_ (optional) -- the damping factor, as part of this equation:

```
damping_amount = 0.9985 + (idamp * 0.002)
```

The default _damping_amount_ is 0.9985 which means that the default value of _idamp_ is 0. The maximum _damping_amount_ is 1.0 (no damping). This means the maximum value for _idamp_ is 0.75.

The recommended range for _idamp_ is usually below 75% of the maximum value.

_imaxshake_ (optional, default=0) -- amount of energy to add back into the system. The value should be in range 0 to 1.

_ifreq_ (optional) -- the main resonant frequency. The default value is 2300.

_ifreq1_ (optional) -- the first resonant frequency. The default value is 5600.

_ifreq2_ (optional) -- the second resonant frequency. The default value is 8100.

### Performance

_kamp_ -- Amplitude of output.  Note: As these instruments are stochastic, this is only an approximation.

## Examples

Here is an example of the tambourine opcode. It uses the file [tambourine.csd](../examples/tambourine.csd).

``` csound-orc title="Example of the tambourine opcode." linenums="1"
--8<-- "examples/tambourine.csd"
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
