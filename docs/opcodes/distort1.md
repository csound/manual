<!--
id:distort1
category:Signal Modifiers:Special Effects
-->
# distort1
Modified hyperbolic tangent distortion.

_distort1_ can be used to generate wave shaping distortion based on a modification of the [tanh](../opcodes/tanh.md) function.

```
       exp(asig * (shape1 + pregain)) - exp(asig * (shape2 - pregain))
aout = ---------------------------------------------------------------
       exp(asig * pregain)            + exp(-asig * pregain)
```

## Syntax
=== "Modern"
    ``` csound-orc
    ares = distort1(asig, kpregain, kpostgain, kshape1, kshape2[, imode])
    ```

=== "Classic"
    ``` csound-orc
    ares distort1 asig, kpregain, kpostgain, kshape1, kshape2[, imode]
    ```

### Initialization

_imode_ (Csound version 5.00 and later only; optional, defaults to 0) -- scales kpregain, kpostgain, kshape1, and kshape2 for use with audio signals in the range -32768 to 32768 (imode=0), -0dbfs to 0dbfs (imode=1), or disables scaling of kpregain and kpostgain and scales kshape1 by kpregain and kshape2 by -kpregain (imode=2).

### Performance

_asig_ -- is the input signal.

_kpregain_ -- determines the amount of gain applied to the signal before waveshaping. A value of 1 gives slight distortion.

_kpostgain_ -- determines the amount of gain applied to the signal after waveshaping.

_kshape1_ -- determines the shape of the positive part of the curve. A value of 0 gives a flat clip, small positive values give sloped shaping.

_kshape2_ -- determines the shape of the negative part of the curve.

## Examples

Here is an example of the distort1 opcode. It uses the file [distort1.csd](../examples/distort1.csd).

``` csound-csd title="Example of the distort1 opcode." linenums="1"
--8<-- "examples/distort1.csd"
```

## See also

[Special Effects](../sigmod/speciale.md)

[Waveshaping](../sigmod/wavshape.md)

## Credits

Author: Hans Mikelson<br>
December 1998<br>

New in Csound version 3.50
