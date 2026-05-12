<!--
id:sc_lag
category:Signal Modifiers:Standard Filters:Control
status:deprecated
-->
# sclag
Exponential lag with 60dB lag time.

Plugin opcode in scugens.

DEPRECATED (renamed as [lag](../opcodes/lag.md))

## Syntax
=== "Modern"
    ``` csound-orc
    aout = sclag(ain, klagtime [, initialvalue])
    kout = sclag(kin, klagtime [, initialvalue])
    ```

=== "Classic"
    ``` csound-orc
    aout sc_lag ain, klagtime [, initialvalue]
    kout sc_lag kin, klagtime [, initialvalue]
    ```

### Initialization

_initialvalue_ If given, sets the internal state. It defaults to the first value passed

### Performance

_ain_ -- input signal

_klagtime_ -- 60 dB lag time in seconds.

_kladown_ -- 60 dB lag time in seconds for the downgoing signal.

This is essentially the same as one pole except that instead of supplying the coefficient directly, it is calculated from a 60 dB lag time. This is the time required for the filter to converge to within 0.01% of a value. This is useful for smoothing out control signals.

## Examples

=== "Modern"
    Here is an example of the sclag opcode. It uses the file [sclag.csd](../examples/sclag.csd).
    ``` csound-csd title="Example of the sc_lag opcode." linenums="1"
    --8<-- "examples/sclag.csd"
    ```

=== "Classic"
    Here is an example of the sc_lag opcode. It uses the file [sc_lag.csd](../examples/sc_lag.csd).
    ``` csound-csd title="Example of the sc_lag opcode." linenums="1"
    --8<-- "examples/sc_lag.csd"
    ```

## See also

[Standard Filters: Control signal filters](../sigmod/standard.md)

## Credits

By: Eduardo Moguillansky 2017
