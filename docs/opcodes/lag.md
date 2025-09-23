<!--
id:lag
category:Signal Modifiers:Standard Filters:Control
-->
# lag
Exponential Lag.

Plugin opcode in scugens.

Exponential lag with 60dB lag time. Port of Supercollider's Lag. This is essentially a one pole filter except that instead of supplying the coefficient directly, it is calculated from a 60 dB lag time. This is the time required for the filter to converge to within 0.01% of a value. This is useful for smoothing out control signals.

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

_initialvalue_ If given, sets the internal state. It defaults to the first value passed

### Performance

_ain_ -- input signal

_klagtime_ -- 60 dB lag time in seconds.

_kladown_ -- 60 dB lag time in seconds for the downgoing signal.

## Examples

Here is an example of the lag opcode. It uses the file [lag.csd](../examples/lag.csd).

``` csound-csd title="Example of the lag opcode." linenums="1"
--8<-- "examples/lag.csd"
```

## See also

[Standard Filters: Control signal filters](../sigmod/standard.md)

## Credits

By: Eduardo Moguillansky 2017
