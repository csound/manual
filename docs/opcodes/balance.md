<!--
id:balance
category:Signal Modifiers:Amplitude Modifiers
-->
# balance
Adjust one audio signal according to the values of another.

The rms power of asig can be interrogated, set, or adjusted to match that of a comparator signal.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = balance(asig, acomp [, ihp] [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    ares balance asig, acomp [, ihp] [, iskip]
    ```

### Initialization

_ihp_ (optional) -- half-power point (in Hz) of a special internal low-pass filter. The default value is 10.

_iskip_ (optional, default=0) -- initial disposition of internal data space (see [reson](../opcodes/reson.md)). The default value is 0.

### Performance

_asig_ -- input audio signal

_acomp_ -- the comparator signal

_balance_ outputs a version of _asig_, amplitude-modified so that its rms power is equal to that of a comparator signal _acomp_. Thus a signal that has suffered loss of power (eg., in passing through a filter bank) can be restored by matching it with, for instance, its own source. It should be noted that [gain](../opcodes/gain.md) and _balance_ provide amplitude modification only - output signals are not altered in any other respect.

## Examples

=== "Modern"
    Here is an example of the balance opcode. It uses the file [balance-modern.csd](../examples/balance-modern.csd).
    ``` csound-csd title="Example of the balance opcode." linenums="1"
    --8<-- "examples/balance-modern.csd"
    ```

=== "Classic"
    Here is an example of the balance opcode. It uses the file [balance.csd](../examples/balance.csd).
    ``` csound-csd title="Example of the balance opcode." linenums="1"
    --8<-- "examples/balance.csd"
    ```

## See also

[Amplitude Modifiers and Dynamic processing](../sigmod/ampmod.md)
