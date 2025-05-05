<!--
id:tonex
category:Signal Modifiers:Standard Filters
-->
# tonex
Emulates a stack of filters using the tone opcode.

_tonex_ is equivalent to a filter consisting of more layers of [tone](../opcodes/tone.md) with the same arguments, serially connected. Using a stack of a larger number of filters allows a sharper cutoff. They are faster than using a larger number instances in a Csound orchestra of the old opcodes, because only one initialization and k- cycle are needed at time and the audio loop falls entirely inside the cache memory of processor.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = tonex(asig, khp [, inumlayer] [, iskip])
    ares = tonex(asig, ahp [, inumlayer] [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    ares tonex asig, khp [, inumlayer] [, iskip]
    ares tonex asig, ahp [, inumlayer] [, iskip]
    ```

### Initialization

_inumlayer_ (optional) -- number of elements in the filter stack. Default value is 4.

_iskip_ (optional, default=0) -- initial disposition of internal data space. Since filtering incorporates a feedback loop of previous output, the initial status of the storage space used is significant. A zero value will clear the space; a non-zero value will allow previous information to remain. The default value is 0.

### Performance

_asig_ -- input signal

_khp_/_ahp_ -- the response curve's half-power point. Half power is defined as peak power / root 2.

## Examples

Here is an example of the tonex opcode. It uses the file [tonex.csd](../examples/tonex.csd).

``` csound-csd title="Example of the tonex opcode." linenums="1"
--8<-- "examples/tonex.csd"
```

## See also

[Standard filters: Low-pass filters](../sigmod/standard.md)

## Credits

Author: Gabriel Maldonado (adapted by John ffitch)<br>
Italy<br>

New in Csound version 3.49

Audio rate parameters introduced in version 6.02

October 2013.
