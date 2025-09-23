<!--
id:balance2
category:Signal Modifiers:Amplitude Modifiers
-->
# balance2
Adjust one audio signal according to the values of another.

The rms power of asig can be interrogated, set, or adjusted to match that of a comparator signal.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = balance2(asig, acomp [, ihp] [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    ares balance2 asig, acomp [, ihp] [, iskip]
    ```

### Initialization

_ihp_ (optional) -- half-power point (in Hz) of a special internal low-pass filter. The default value is 10.

_iskip_ (optional, default=0) -- initial disposition of internal data space (see [reson](../opcodes/reson.md)). The default value is 0.

### Performance

_asig_ -- input audio signal

_acomp_ -- the comparator signal

_balance2_ outputs a version of _asig_, amplitude-modified so that its rms power is equal to that of a comparator signal _acomp_. Thus a signal that has suffered loss of power (eg., in passing through a filter bank) can be restored by matching it with, for instance, its own source. It should be noted that [gain](../opcodes/gain.md) and _balance2_ provide amplitude modification only - output signals are not altered in any other respect.

Note that _balance2_ is just like _balance_ except the gain is recalculated for every sample rather than interpolating k-rate values.

## Examples

=== "Modern"
    Here is an example of the balance2 opcode. It uses the file [balance2-modern.csd](../examples/balance2-modern.csd).
    ``` csound-csd title="Example of the balance2 opcode." linenums="1"
    --8<-- "examples/balance2-modern.csd"
    ```

=== "Classic"
    Here is an example of the balance opcode. It uses the file [balance2.csd](../examples/balance2.csd).
    ``` csound-csd title="Example of the balance2 opcode." linenums="1"
    --8<-- "examples/balance2.csd"
    ```

## See also

[Amplitude Modifiers and Dynamic processing](../sigmod/ampmod.md)

## Credits

Author: Victor Lazzarini;<br>
March 2018<br>

New in Csound version 6.11
