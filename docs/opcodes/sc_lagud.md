<!--
id:sc_lagud
category:Signal Modifiers:Standard Filters:Control
status:deprecated
-->
# sclagud
Exponential Lag (Deprecated).

Plugin opcode in scugens.

Exponential lag with a smoothing time for up- and down signals. DEPRECATED (renamed as 
[lagud](../opcodes/lagud.md))

## Syntax
=== "Modern"
    ``` csound-orc
    aout = sclagud(ain, klagup, klagdown [, initialvalue])
    kout = sclagud(kin, klagup, klagdown [, initialvalue])
    ```

=== "Classic"
    ``` csound-orc
    aout sclagud ain, klagup, klagdown [, initialvalue]
    kout sclagud kin, klagup, klagdown [, initialvalue]
    ```

### Initialization

_initialvalue_ If given, sets the internal state. Defaults to the first value passed.

### Performance

_ain_ -- input signal

_klagup_ -- 60 dB lag time in seconds for the upgoing signal.

_klagdown_ -- 60 dB lag time in seconds for the downgoing signal.

This is essentially the same as sc_lag except that you can supply a different 60 dB time for when the signal goes up, from when the signal goes down. This is useful for smoothing out control signals, where "fade in" should be different from "fade out".

## Examples
=== "Modern"
    Here is an example of the sclagud opcode. It uses the file [sclagud.csd](../examples/sclagud.csd).
    ``` csound-csd title="Example of the sclagud opcode." linenums="1"
    --8<-- "examples/sclagud.csd"
    ```

=== "Classic"
    Here is an example of the sc_lagud opcode. It uses the file [sc_lagud.csd](../examples/sc_lagud.csd).
    ``` csound-csd title="Example of the sc_lagud opcode." linenums="1"
    --8<-- "examples/sc_lagud.csd"
    ```

## See also

[Standard Filters: Control signal filters](../sigmod/standard.md)

## Credits

By: Eduardo Moguillansky 2017
