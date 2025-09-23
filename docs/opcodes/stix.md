<!--
id:stix
category:Signal Generators:Models and Emulations
-->
# stix
Semi-physical model of a stick sound.

It is one of the PhISEM percussion opcodes. PhISEM (Physically Informed Stochastic Event Modeling) is an algorithmic approach for simulating collisions of multiple independent sound producing objects.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = stix(iamp, idettack [, inum] [, idamp] [, imaxshake])
    ```

=== "Classic"
    ``` csound-orc
    ares stix iamp, idettack [, inum] [, idamp] [, imaxshake]
    ```

### Initialization

_iamp_ -- Amplitude of output.  Note: As these instruments are stochastic, this is only a approximation.

_idettack_ -- period of time over which all sound is stopped

_inum_ (optional) -- The number of beads, teeth, bells, timbrels, etc.  If zero, the default value is 30.

_idamp_ (optional) -- the damping factor, as part of this equation:

```
damping_amount = 0.998 + (idamp * 0.002)
```

The default _damping_amount_ is 0.998 which means that the default value of _idamp_ is 0. The maximum _damping_amount_ is 1.0 (no damping). This means the maximum value for _idamp_ is 1.0.

The recommended range for _idamp_ is usually below 75% of the maximum value.

_imaxshake_ (optional) -- amount of energy to add back into the system. The value should be in range 0 to 1.

## Examples

Here is an example of the stix opcode. It uses the file [stix.csd](../examples/stix.csd).

``` csound-orc title="Example of the stix opcode." linenums="1"
--8<-- "examples/stix.csd"
```

## See Also

[Models and Emulations](../siggen/models.md)

## Credits

Author: Perry Cook, part of the PhOLIES (Physically-Oriented Library of Imitated Environmental Sounds)<br>
Adapted by John ffitch<br>
University of Bath, Codemist Ltd.<br>
Bath, UK<br>

New in Csound version 4.07

Added notes by Rasmus Ekman on May 2002.
