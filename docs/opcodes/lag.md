<!--
id:lag
category:Signal Modifiers:Standard Filters:Control
-->
# lag
Exponential Lag.

Plugin opcode in scugens.

`lag` smooths a signal with a 60 dB lag time. For a constant input, this is the time needed to reduce the difference from the target to 0.1% of its starting value. It is a port of SuperCollider's `Lag`.

## Syntax
=== "Modern"
    ``` csound-orc
    aout = lag(ain, klagtime [, initialvalue])
    kout = lag(kin, klagtime [, initialvalue])
    ```

=== "Classic"
    ``` csound-orc
    aout lag ain, klagtime [, initialvalue]
    kout lag kin, klagtime [, initialvalue]
    ```

### Initialization

_initialvalue_ -- optional starting value for the filter. If omitted, the filter starts at the first input value.

### Performance

_ain_, _kin_ -- input signal

_klagtime_ -- 60 dB lag time in seconds. Use zero for no smoothing.

At audio rate, changes to the lag time take effect smoothly over one control block.

## Examples

Here is an example of the lag opcode. It uses the file [lag.csd](../examples/lag.csd).

``` csound-csd title="Example of the lag opcode." linenums="1"
--8<-- "examples/lag.csd"
```

## See also

[Standard Filters: Control signal filters](../sigmod/standard.md)

## Credits

By: Eduardo Moguillansky 2017
