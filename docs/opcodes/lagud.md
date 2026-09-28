<!--
id:lagud
category:Signal Modifiers:Standard Filters:Control
-->
# lagud
Exponential Lag.

Plugin opcode in scugens.

Exponential lag with different smoothing time for up- and downgoing signals. Port of Supercollider's LagUD.

This is essentially the same as the opcode _lag_ except that you can supply a different 60 dB time for ascending and descending signals. This is useful for smoothing out control signals, where "fade in" should be different from "fade out", or to model the attack/release of a gate, etc.

For a constant input, each lag time specifies how long it takes to reduce the difference from the target to 0.1% of its starting value.

## Syntax
=== "Modern"
    ``` csound-orc
    aout = lagud(ain, klagup, klagdown [, initialvalue])
    kout = lagud(kin, klagup, klagdown [, initialvalue])
    ```

=== "Classic"
    ``` csound-orc
    aout lagud ain, klagup, klagdown [, initialvalue]
    kout lagud kin, klagup, klagdown [, initialvalue]
    ```

### Initialization

_initialvalue_ -- optional starting value for the filter. If omitted, the filter starts at the first input value.

### Performance

_ain_, _kin_ -- input signal

_klagup_ -- 60 dB lag time in seconds for the upgoing signal. Use zero for no smoothing in this direction.

_klagdown_ -- 60 dB lag time in seconds for the downgoing signal. Use zero for no smoothing in this direction.

At audio rate, changes to the lag times take effect smoothly over one control block.

## Examples

Here is an example of the lagud opcode. It uses the file [lagud.csd](../examples/lagud.csd).

``` csound-csd title="Example of the lagud opcode." linenums="1"
--8<-- "examples/lagud.csd"
```

## See also

[Standard Filters: Control signal filters](../sigmod/standard.md)

## Credits

By: Eduardo Moguillansky 2017
