<!--
id:atonex
category:Signal Modifiers:Standard Filters
-->
# atonex
Emulates a stack of filters using the atone opcode.

_atonex_ is equivalent to a filter consisting of more layers of [atone](../opcodes/atone.md) with the same arguments, serially connected. Using a stack of a larger number of filters allows a sharper cutoff. They are faster than using a larger number instances in a Csound orchestra of the old opcodes, because only one initialization and k- cycle are needed at time and the audio loop falls entirely inside the cache memory of processor.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = atonex(asig, khp [, inumlayer] [, iskip])
    ares = atonex(asig, ahp [, inumlayer] [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    ares atonex asig, khp [, inumlayer] [, iskip]
    ares atonex asig, ahp [, inumlayer] [, iskip]
    ```

### Initialization

_inumlayer_ (optional) -- number of elements in the filter stack. Default value is 4.

_iskip_ (optional, default=0) -- initial disposition of internal data space. Since filtering incorporates a feedback loop of previous output, the initial status of the storage space used is significant. A zero value will clear the space; a non-zero value will allow previous information to remain. The default value is 0.

### Performance

_asig_ -- input signal

_khp_/_ahp_ -- the response curve's half-power point. Half power is defined as peak power / root 2.

## Examples

=== "Modern"
    Here is an example of the atonex opcode. It uses the file [atonex-modern.csd](../examples/atonex-modern.csd).
    ``` csound-csd title="Example of the atonex opcode." linenums="1"
    --8<-- "examples/atonex-modern.csd"
    ```

=== "Classic"
    Here is an example of the atonex opcode. It uses the file [atonex.csd](../examples/atonex.csd).
    ``` csound-csd title="Example of the atonex opcode." linenums="1"
    --8<-- "examples/atonex.csd"
    ```

## See also

[Standard filters: Hi-pass filters](../sigmod/standard.md)

## Credits

Author: Gabriel Maldonado (adapted by John ffitch)<br>
Italy<br>

New in Csound version 3.49

Audio rate parameters introduced in version 6.02

October 2013.
