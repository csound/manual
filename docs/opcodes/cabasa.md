<!--
id:cabasa
category:Signal Generators:Models and Emulations
-->
# cabasa
Semi-physical model of a cabasa sound.

It is one of the PhISEM percussion opcodes. PhISEM (Physically Informed Stochastic Event Modeling) is an algorithmic approach for simulating collisions of multiple independent sound producing objects.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = cabasa(iamp, idettack [, inum] [, idamp] [, imaxshake])
    ```

=== "Classic"
    ``` csound-orc
    ares cabasa iamp, idettack [, inum] [, idamp] [, imaxshake]
    ```

### Initialization

_iamp_ -- Amplitude of output.  Note: As these instruments are stochastic, this is only a approximation.

_idettack_ -- period of time over which all sound is stopped

_inum_ (optional) -- The number of beads, teeth, bells, timbrels, etc.  If zero, the default value is 512.

_idamp_ (optional) -- the damping factor, as part of this equation:

```
damping_amount = 0.998 + (idamp * 0.002)
```

The default _damping_amount_ is 0.997 which means that the default value of _idamp_ is -0.5. The maximum _damping_amount_ is 1.0 (no damping). This means the maximum value for _idamp_ is 1.0.

The recommended range for _idamp_ is usually below 75% of the maximum value.

_imaxshake_ (optional) -- amount of energy to add back into the system. The value should be in range 0 to 1.

## Examples

=== "Modern"
    Here is an example of the cabasa opcode. It uses the file [cabasa-modern.csd](../examples/cabasa-modern.csd).
    ``` csound-orc title="Example of the cabasa opcode." linenums="1"
    --8<-- "examples/cabasa-modern.csd"
    ```

=== "Classic"
    Here is an example of the cabasa opcode. It uses the file [cabasa.csd](../examples/cabasa.csd).
    ``` csound-orc title="Example of the cabasa opcode." linenums="1"
    --8<-- "examples/cabasa.csd"
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
